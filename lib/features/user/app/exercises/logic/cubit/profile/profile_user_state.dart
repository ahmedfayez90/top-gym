part of 'profile_user_cubit.dart';

abstract class ProfileUserState extends Equatable {
  @override
  List<Object> get props => [];

  const ProfileUserState();
}

class ProfileUserInitial extends ProfileUserState {}

class CheckFingerPrintState extends ProfileUserState {}

class EnableFingerPrintState extends ProfileUserState {}

class FalseValueState extends ProfileUserState {}

class TrueValueState extends ProfileUserState {}

class LightThemeState extends ProfileUserState {}

class DarkThemeState extends ProfileUserState {}

class CurrentChangeTitleIndex extends ProfileUserState {}

class NextChangeTitleIndex extends ProfileUserState {}

class UpdateDateSuccess extends ProfileUserState {}

class UpdateDateError extends ProfileUserState {}


//
// class UpdateUserDetailsSuccessState extends ProfileUserState {}
// class UpdateUserDetailsLoadingState extends ProfileUserState {}
// class UpdateUserDetailsErrorState extends ProfileUserState {}

class GetUserLoadingStates extends ProfileUserState {}
class GetUserSuccessStates extends ProfileUserState {}
class GetUserErrorStates extends ProfileUserState {
  final String e;
const  GetUserErrorStates({ required this.e});
}

