import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:top_gym/features/user/auth/finger_print/finger_print.dart';
import 'package:top_gym/features/user/core/keys.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit() : super(LoginUserInitial());

  static LoginUserCubit get(context) => BlocProvider.of(context);

  bool isTextPasswordEmpty = false;
  bool isTextEmailEmpty = false;

  void validTextEmailEmpty(String val) {
    if (val.isNotEmpty) {
      isTextEmailEmpty = true;
      emit(UnEmptyEmail());
    } else {
      isTextEmailEmpty = false;
      emit(EmptyEmail());
    }
  }

  void validTextPasswordEmpty(String val) {
    if (val.isNotEmpty) {
      isTextPasswordEmpty = true;
      emit(UnEmptyPassword());
    } else {
      isTextPasswordEmpty = false;
      emit(EmptyPassword());
    }
  }

  bool obscureText = true;

  void visibility() {
    emit(UnVisibilityEyes());
    obscureText = !obscureText;
    emit(VisibilityEyes());
  }

  final _firebaseAuth = FirebaseAuth.instance;
  final storage = const FlutterSecureStorage();
  Future<User?> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(LoadingLoginUserState());
    try {
      final userAuth = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
        storage.write(key: Keys.userName, value: email);
       storage.write(key: Keys.password , value: password) ;
      emit(SuccessLoginUserState(uId: userAuth.user!.uid));
      return userAuth.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ErrorLoginUserNotFoundState(e.code));
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(ErrorLoginWrongPasswordState(e.code));
        log('Wrong password provided for that user.');
      }
    } catch (e) {
      emit(ErrorLoginUserState(e.toString()));
    }
    return null;
  }

  Future<UserCredential?> signInWithGoogle() async {
    emit(LoadingLoginGoogleUserState());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      emit(SuccessLoginGoogleUserState());
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      emit(ErrorLoginGoogleUserState(e.toString()));
    }
    return null;
  }

  ////////////////////////////////////// login finger print ////////////////////////////////////////////////////////


  String fPrint = '';

  void checkFingerPrint() async {
    print("ahmed fayez");
    fPrint = await storage.read(key: Keys.fingerPrint) ?? '';
    emit(LoginCheckFingerPrintState());
  }

  void loginWithFingerPrint() async {
    emit(LoginWithFingerPrintLoadingState());
    FingerPrint fingerPrint = FingerPrint();
    bool isFingerPrintEnabled = await fingerPrint.isFingerPrintEnabled();
    if (isFingerPrintEnabled) {
      bool isAuth = await fingerPrint.isAuth('login using finger print');
      if (isAuth) {
        String userName = await storage.read(key: Keys.userName) ?? '';
        String password = await storage.read(key: Keys.password) ?? '';
        loginWithEmailAndPassword(
          email: userName,
          password: password,
        );
      }
    }
  }
}
