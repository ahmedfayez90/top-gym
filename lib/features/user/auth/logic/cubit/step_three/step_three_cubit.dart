import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'step_three_state.dart';

class StepThreeCubit extends Cubit<StepThreeState> {
  StepThreeCubit() : super(StepThreeInitial());

 static StepThreeCubit get(context) => BlocProvider.of(context);


  int validationFun() {
    int steps = 0;
    Map<String, bool> mapButtons = {
      'Competitive': buttonSelectedCompetitive,
      'MuscleForGeneral': buttonSelectedGainMuscleForGeneral,
      'IamUnderWeight': buttonSelectedIamUnderWeight,
      'MyHealthcare': buttonSelectedMyHealthcare,
      'Other': buttonSelectedOther,

    };
    mapButtons.forEach((key, value) {
      if (value == true) {
        steps++;
      }
    });
    return steps;
  }


  bool buttonSelectedCompetitive = false;
  bool buttonSelectedGainMuscleForGeneral = false;
  bool buttonSelectedIamUnderWeight = false;
  bool buttonSelectedMyHealthcare = false;
  bool buttonSelectedOther = false;
//1
  void changeButtonColorCompetitiveCount() {
    emit(UnPressButtonStepThreeCompetitiveState());
    buttonSelectedCompetitive = !buttonSelectedCompetitive;
    emit(PressButtonStepThreeCompetitiveState());
  }
// 2
  void changeButtonColorGainMuscleForGeneral() {
    emit(UnPressButtonStepThreeGainMuscleState());
    buttonSelectedGainMuscleForGeneral = !buttonSelectedGainMuscleForGeneral;
    emit(PressButtonStepThreeGainMuscleState());
  }
//3
  void changeButtonColorIamUnderWeight() {
    emit(UnPressButtonStepThreeCompetitiveState());
    buttonSelectedIamUnderWeight = !buttonSelectedIamUnderWeight;
    emit(PressButtonStepThreeCompetitiveState());
  }
//4
  void changeButtonColorMyHealthcare() {
    emit(UnPressButtonStepThreeCompetitiveState());
    buttonSelectedMyHealthcare = !buttonSelectedMyHealthcare;
    emit(PressButtonStepThreeCompetitiveState());
  }
//5
  void changeButtonColorOther() {
    emit(UnPressButtonStepThreeCompetitiveState());
    buttonSelectedOther = !buttonSelectedOther;
    emit(PressButtonStepThreeCompetitiveState());
  }





















}
