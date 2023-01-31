import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'step_fourth_state.dart';

class StepFourthCubit extends Cubit<StepFourthState> {
  StepFourthCubit() : super(StepFourthInitial());

  static StepFourthCubit get(context) => BlocProvider.of(context);

  bool validGender() {
    bool gender = selectedMale == true || selectedFeMale == true;
    return gender;
  }

  ////////////Fourth Page
  bool selectedMale = false;
  bool selectedFeMale = false;

  void selectedMaleFun() {
    emit(UnSelectedMaleState());

    selectedMale = !selectedMale;

    emit(SelectedMaleState());
  }

  void selectedFeMaleFun() {
    emit(UnSelectedFeMaleState());
    selectedFeMale = !selectedFeMale;

    emit(SelectedFeMaleState());
  }
}
