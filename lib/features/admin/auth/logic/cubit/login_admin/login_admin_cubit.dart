import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_strings.dart';

part 'login_admin_state.dart';

class LoginAdminCubit extends Cubit<LoginAdminState> {
  LoginAdminCubit() : super(LoginAdminInitial());

  static LoginAdminCubit get(context) => BlocProvider.of(context);
  final auth = FirebaseAuth.instance;

   late String verification ;

  Future<void> submitPhoneNumber({required String phoneNumber}) async {
    emit(LoadingLoginAdminState());
    await auth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      timeout: const Duration(seconds: 14),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
  void codeSent(String verificationId, int? resendToken) async {
    verification = verificationId;
    emit(PhoneNumberSubmitAdminState());
  }

  void submitOtp(String otpCode) async {
    log('/////////////////////////////////////////////////////////////////');
    log(verification);
    log('/////////////////////////////////////////////////////////////////');
    PhoneAuthCredential credential =  PhoneAuthProvider.credential(
        verificationId: verification, smsCode: otpCode);
    await signIn(credential);
  }
  void verificationCompleted(PhoneAuthCredential credential) async {
    await signIn(credential);
  }





  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await auth.signInWithCredential(credential);
      emit(PhoneOtpVerifiedAdminState());
    } on FirebaseAuthException catch (e) {
      emit(ErrorLoginAdminState(e.toString()));
    } catch (e) {
      emit(ErrorLoginAdminState(e.toString()));
    }
  }
  void verificationFailed(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      log('The provided phone number is not valid.');
      emit(ErrorLoginAdminState(e.code));
    }
  }





  Future<void> logout() async {
    await auth.signOut();
  }

  User getLoggedInUser() {
    User currentUser = auth.currentUser!;
    return currentUser;
  }

  TextEditingController phoneController = TextEditingController();

  void onChanges(String val) {
    emit(DecreaseState());
    phoneController.text = val;
    emit(IncreaseState());
  }
  String? validator(String? val) {
    if (val!.isEmpty) {
      return AppStringsOfAuthAdmin.pleaseEnterPhone;
    } else if (val.length < 11) {
      return AppStringsOfAuthAdmin.tooShortPhone;
    } else if (val.length > 11) {
      return 'Too long';
    }
    return null;
  }
}
