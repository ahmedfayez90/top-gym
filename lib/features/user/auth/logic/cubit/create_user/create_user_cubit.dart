import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_gym/core/utils/api_path.dart';
import '../../../../../../core/services/database.dart';
import '../../../../core/gools_data.dart';
import '../../../presentation/model/user_data_model.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit() : super(CreateUserInitial());

  static CreateUserCubit get(context) => BlocProvider.of(context);

  final _firebaseAuth = FirebaseAuth.instance;
  final DataBase dataBase = FireStoreDatabase();

  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(LoadingCreateUserState());
    try {
      final userAuth = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserData userData = UserData(
          uid: userAuth.user!.uid,
          email: email,
          age: GoalsDataUser.age,
          country: GoalsDataUser.country,
          zipCode: GoalsDataUser.zipCode,
          height: GoalsDataUser.height,
          weight: GoalsDataUser.weight,
          male: GoalsDataUser.male,
          feMale: GoalsDataUser.feMale,
          isUser: GoalsDataUser.isUser);
      await dataBase.setUserData(userData);
      // print(await dataBase.checkIsUser(email, userAuth.user!.uid));
      // final DocumentSnapshot userFound = await FirebaseFirestore.instance
      //     .collection(ApiPath.user(userAuth.user!.uid))
      //     .doc(userAuth.user!.uid)
      //     .get();
      // final _userF = userFound.get("User");
      // print(_userF);
      // print(
      //     "**********************************************************************************");

      emit(SuccessCreateUserState());
      return userAuth.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(ErrorCreateWeakPasswordState(e.code));
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emit(ErrorCreateEmailAlreadyInUseState(e.code));
        log('The account already exists for that email.');
      }
    } catch (e) {
      emit(ErrorCreateUserState(e.toString()));
    }
    return null;
  }

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    emit(SignOutLoadingUserState());
    try {
      await _firebaseAuth.signOut();
      emit(SignOutSuccessUserState());
    } catch (e) {
      emit(SignOutErrorUserState(e.toString()));
    }
  }
}
