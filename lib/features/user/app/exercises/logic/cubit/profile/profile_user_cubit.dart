import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:top_gym/features/user/auth/finger_print/finger_print.dart';
import 'package:top_gym/features/user/core/keys.dart';

part 'profile_user_state.dart';

class ProfileUserCubit extends Cubit<ProfileUserState> {
  ProfileUserCubit() : super(ProfileUserInitial());

  static ProfileUserCubit get(context) => BlocProvider.of(context);



  final _firebaseAuth = FirebaseAuth.instance;
  // User currentUser() {
  //   var user = _firebaseAuth.currentUser;
  //   return user!;
  // }
















  // Future<void> signOut() async {
  //   // emit(SignOutLoadingUserProfileState());
  //   try {
  //     // await _firebaseAuth.signOut();
  //     await FirebaseAuth.instance.signOut();
  //     // emit(SignOutSuccessUserProfileState());
  //   }on FirebaseAuthException catch (e) {
  //     // emit(SignOutErrorUserProfileState(e.toString()));
  //   }catch(e){
  //     rethrow;
  //   }
  // }

// this must be initial Function when called the cubit
  Future<bool> authFingerPrint() async {
    bool isAuth = false;
    FingerPrint fingerPrint = FingerPrint();
    bool isFingerPrintEnabled = await fingerPrint.isFingerPrintEnabled();
    if (isFingerPrintEnabled) {
      isAuth = await fingerPrint.isAuth('login using finger print');
    }
    return isAuth;
  }

// check fingerprint

  final FingerPrint fingerPrint = FingerPrint();
  final storage = const FlutterSecureStorage();
  bool isSwitchChecked = false;
  String fPrint = '';



  void checkFingerPrint()async{
    fPrint = await storage.read(key: Keys.fingerPrint) ?? '' ;
    isSwitchChecked = fPrint.isNotEmpty;
    emit(CheckFingerPrintState());
  }

void enableFingerPrint(value)async{
    bool isFingerPrintEnabled =false;
if(value){
  isFingerPrintEnabled = await fingerPrint.isFingerPrintEnabled();
  if(isFingerPrintEnabled){
    await storage.write(key: Keys.fingerPrint, value: 'checked');
  }
}else{
  storage.delete(key: Keys.fingerPrint);
}
isSwitchChecked= value;
print("${value} ********************************************************");
emit(EnableFingerPrintState());







}
























































}
