part of 'layout_goal_cubit.dart';

abstract class LayoutGoalState extends Equatable {
  const LayoutGoalState();
}

class LayoutGoalInitial extends LayoutGoalState {
  @override
  List<Object> get props => [];
}

class NextPageState extends LayoutGoalState {
  @override
  List<Object?> get props => [];
}

class CurrentPageState extends LayoutGoalState {
  @override
  List<Object?> get props => [];
}

class PreviousPageState extends LayoutGoalState {
  @override
  List<Object?> get props => [];
}
