part of 'create_user_cubit.dart';

abstract class CreateUserState extends Equatable {
  @override
  List<Object> get props => [];

  const CreateUserState();
}

class CreateUserInitial extends CreateUserState {}

class LoadingCreateUserState extends CreateUserState {}

class SuccessCreateUserState extends CreateUserState {}

class ErrorCreateUserState extends CreateUserState {
  final String msgError;
  const ErrorCreateUserState(this.msgError);
}

class ErrorCreateWeakPasswordState extends CreateUserState {
  final String msgError;
  const ErrorCreateWeakPasswordState(this.msgError);
}

class ErrorCreateEmailAlreadyInUseState extends CreateUserState {
  final String msgError;
  const ErrorCreateEmailAlreadyInUseState(this.msgError);
}

class SignOutSuccessUserState extends CreateUserState {}

class SignOutLoadingUserState extends CreateUserState {}

class SignOutErrorUserState extends CreateUserState {
  final String error;
  const SignOutErrorUserState(this.error);
}
