part of 'create_workout_plan_bloc.dart';

abstract class CreateWorkoutPlanEvent extends Equatable {}

class FetchBodyPartListEvent extends CreateWorkoutPlanEvent{
  @override
  List<Object?> get props => [];
}


class FetchExerciseListEvent extends CreateWorkoutPlanEvent{
  @override
  List<Object?> get props => [];
}

class BodyItemDropdownEvent extends CreateWorkoutPlanEvent{
  String? selectedValue;
  BodyItemDropdownEvent({this.selectedValue});
  @override
  List<Object?> get props => [selectedValue];
}

class ExerciseItemDropdownEvent extends CreateWorkoutPlanEvent{
  ExerciseModel? selectedValue;
  ExerciseItemDropdownEvent({this.selectedValue});

  @override
  List<Object?> get props => [selectedValue];
}

class PriorityItemDropdownEvent extends CreateWorkoutPlanEvent{
  String? selectedValue;
  PriorityItemDropdownEvent({this.selectedValue});

  @override
  List<Object?> get props => [selectedValue];
}

class TimerDurationUpdateEvent extends CreateWorkoutPlanEvent{
  Duration? duration;
  TimerDurationUpdateEvent({this.duration});

  @override
  List<Object?> get props => [duration];
}

class AddWorkoutPlanEvent extends CreateWorkoutPlanEvent{
  AddWorkoutPlanEvent();

  @override
  List<Object?> get props => [];
}