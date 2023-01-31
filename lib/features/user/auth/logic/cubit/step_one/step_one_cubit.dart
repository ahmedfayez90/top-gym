import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'step_one_state.dart';

class StepOneCubit extends Cubit<StepOneState> {
  StepOneCubit() : super(StepOneInitial());

  static StepOneCubit get(context) => BlocProvider.of(context);

  int validationFun() {
    int steps = 0;
    Map<String, bool> mapButtons = {
      'LoseWeight': buttonSelectedLoseWeight,
      'MaintainWeight': buttonSelectedMaintainWeight,
      'GainWeight': buttonSelectedGainWeight,
      'GainMuscle': buttonSelectedGainMuscle,
      'ModifyMyDiet': buttonSelectedModifyMyDiet,
      'ManageStress': buttonSelectedManageStress,
      'MyStepCount': buttonSelectedIncreaseMyStepCount,
    };
    mapButtons.forEach((key, value) {
      if (value == true) {
        steps++;
      }
    });
    return steps;
  }

  bool buttonSelectedLoseWeight = false;
  bool buttonSelectedMaintainWeight = false;
  bool buttonSelectedGainWeight = false;
  bool buttonSelectedGainMuscle = false;
  bool buttonSelectedModifyMyDiet = false;
  bool buttonSelectedManageStress = false;
  bool buttonSelectedIncreaseMyStepCount = false;

//1
  void changeButtonColorLoseWeight() {
    emit(UnPressButtonLayoutGoalToLoseWeightState());
    buttonSelectedLoseWeight = !buttonSelectedLoseWeight;
    emit(PressButtonLayoutGoalToLoseWeightState());
  }

//2
  void changeButtonColorMaintainWeight() {
    emit(UnPressButtonLayoutGoalToMaintainWeightState());
    buttonSelectedMaintainWeight = !buttonSelectedMaintainWeight;
    emit(PressButtonLayoutGoalToMaintainWeightState());
  }

//3
  void changeButtonColorGainWeight() {
    emit(UnPressButtonLayoutGoalToGainWeightState());
    buttonSelectedGainWeight = !buttonSelectedGainWeight;
    emit(PressButtonLayoutGoalToGainWeightState());
  }

//4
  void changeButtonColorGainMuscle() {
    emit(UnPressButtonLayoutGoalToGainMuscleState());
    buttonSelectedGainMuscle = !buttonSelectedGainMuscle;
    emit(PressButtonLayoutGoalToGainMuscleState());
  }

//5
  void changeButtonColorModifyMyDiet() {
    emit(UnPressButtonLayoutGoalToModifyMyDietState());
    buttonSelectedModifyMyDiet = !buttonSelectedModifyMyDiet;
    emit(PressButtonLayoutGoalToModifyMyDietState());
  }

//6
  void changeButtonColorManageStress() {
    emit(UnPressButtonLayoutGoalToManageStressState());
    buttonSelectedManageStress = !buttonSelectedManageStress;
    emit(PressButtonLayoutGoalToManageStressState());
  }

//7
  void changeButtonColorIncreaseMyStepCount() {
    emit(UnPressButtonLayoutGoalToIncreaseMyStepCountState());
    buttonSelectedIncreaseMyStepCount = !buttonSelectedIncreaseMyStepCount;
    emit(PressButtonLayoutGoalToIncreaseMyStepCountState());
  }
}
