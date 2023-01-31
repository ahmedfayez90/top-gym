import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/view/goals_view/one_goal/create_account.dart';
import '../../../presentation/view/goals_view/one_goal/step_fifth.dart';
import '../../../presentation/view/goals_view/one_goal/step_fourth.dart';
import '../../../presentation/view/goals_view/one_goal/step_one.dart';
import '../../../presentation/view/goals_view/one_goal/step_three.dart';
import '../../../presentation/view/goals_view/one_goal/step_two.dart';

part 'layout_goal_state.dart';

class LayoutGoalCubit extends Cubit<LayoutGoalState> {
  LayoutGoalCubit() : super(LayoutGoalInitial());

  static LayoutGoalCubit get(context) => BlocProvider.of(context);



  List<Widget> stepsItems = [
    const StepOne(),
    const StepTwo(),
    const StepThree(),
    StepFourth(),
    StepFifth(),
    CreateAccount(),
  ];


  late PageController pageController;
  void init() {
    pageController = PageController(initialPage: 0);
  }

  int currentIndex = 1;
  int totalSteps = 6;
  void nextPageIndicator() {
    emit(CurrentPageState());
    if (currentIndex < totalSteps + 1) {
      currentIndex++;
    }
    emit(NextPageState());
  }
  void previsePageIndicator() {
    emit(CurrentPageState());
    if (currentIndex <= totalSteps && currentIndex != 0) {
      currentIndex--;
    }
    emit(PreviousPageState());
  }



}
