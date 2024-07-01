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