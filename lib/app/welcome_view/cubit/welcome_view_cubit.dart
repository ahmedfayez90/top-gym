import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'welcome_view_state.dart';

class WelcomeViewCubit extends Cubit<WelcomeViewState> {
  WelcomeViewCubit() : super(WelcomeViewInitial());

  File? imageFile = null;
}
