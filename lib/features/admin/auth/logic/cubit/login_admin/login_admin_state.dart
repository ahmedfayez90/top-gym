part of 'login_admin_cubit.dart';

abstract class LoginAdminState extends Equatable {
  const LoginAdminState();
}

class LoginAdminInitial extends LoginAdminState {
  @override
  List<Object> get props => [];
}

class PhoneNumberSubmitAdminState extends LoginAdminState {
  @override
  List<Object?> get props => [];
}

class PhoneOtpVerifiedAdminState extends LoginAdminState {
  @override
  List<Object?> get props => [];
}

class LoadingLoginAdminState extends LoginAdminState {
  @override
  List<Object?> get props => [];
}

class ErrorLoginAdminState extends LoginAdminState {
  final String error;

  const ErrorLoginAdminState(this.error);

  @override
  List<Object?> get props => [];
}

class IncreaseState extends LoginAdminState {
  @override
  List<Object?> get props => [];
}

class DecreaseState extends LoginAdminState {
  @override
  List<Object?> get props => [];
}
