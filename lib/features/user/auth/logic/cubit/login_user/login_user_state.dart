part of 'login_user_cubit.dart';

abstract class LoginUserState extends Equatable {
  const LoginUserState();
}

class LoginUserInitial extends LoginUserState {
  @override
  List<Object> get props => [];
}

class VisibilityEyes extends LoginUserState {
  @override
  List<Object> get props => [];
}

class UnVisibilityEyes extends LoginUserState {
  @override
  List<Object> get props => [];
}

class EmptyEmail extends LoginUserState {
  @override
  List<Object?> get props => [];
}

class UnEmptyEmail extends LoginUserState {
  @override
  List<Object?> get props => [];
}

class EmptyPassword extends LoginUserState {
  @override
  List<Object?> get props => [];
}

class UnEmptyPassword extends LoginUserState {
  @override
  List<Object?> get props => [];
}

class LoadingLoginUserState extends LoginUserState {
  @override
  List<Object?> get props => [];
}

class SuccessLoginUserState extends LoginUserState {
  @override
  List<Object?> get props => [];
}

class ErrorLoginUserState extends LoginUserState {
 final String msgError;
 const ErrorLoginUserState(this.msgError);
  @override
  List<Object?> get props => [msgError];
}

class ErrorLoginUserNotFoundState extends LoginUserState {
 final String msgError;
 const ErrorLoginUserNotFoundState(this.msgError);
  @override
  List<Object?> get props => [msgError];
}

class ErrorLoginWrongPasswordState extends LoginUserState {
 final String msgError;
 const ErrorLoginWrongPasswordState(this.msgError);
  @override
  List<Object?> get props => [msgError];
}
class LoadingLoginGoogleUserState extends LoginUserState {
  @override
  List<Object?> get props => [];
}

class SuccessLoginGoogleUserState extends LoginUserState {
  @override
  List<Object?> get props => [];
}
class ErrorLoginGoogleUserState extends LoginUserState {
  final String msgError;
  const ErrorLoginGoogleUserState(this.msgError);
  @override
  List<Object?> get props => [msgError];
}

class LoginCheckFingerPrintState extends LoginUserState {
  @override
  List<Object?> get props => [];
}class LoginWithFingerPrintLoadingState extends LoginUserState {
  @override
  List<Object?> get props => [];
}