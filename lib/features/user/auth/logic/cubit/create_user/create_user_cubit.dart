import 'dart:developer';
import '../../../../../../core/config/routes/app.dart';

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
        phoneNumber: userAuth.user!.phoneNumber ?? '',
          name: userAuth.user!.displayName ?? '',
          imageUrl: userAuth.user!.photoURL ?? '',
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
      emit(SuccessCreateUserState(uId: userAuth.user!.uid));
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
