part of 'profile_user_cubit.dart';

abstract class ProfileUserState extends Equatable {
  @override
  List<Object> get props => [];

  const ProfileUserState();
}

class ProfileUserInitial extends ProfileUserState {}

class SignOutSuccessUserProfileState extends ProfileUserState {}

class SignOutLoadingUserProfileState extends ProfileUserState {}

class CheckFingerPrintState extends ProfileUserState {}
class EnableFingerPrintState extends ProfileUserState {}

class SignOutErrorUserProfileState extends ProfileUserState {
  final String error;

  const SignOutErrorUserProfileState(this.error);
}
