part of 'running_exercise_bloc.dart';

abstract class RunningExerciseState extends Equatable {
  Resource<ExerciseModel>? exerciseDetailsResponse;

  RunningExerciseState({this.exerciseDetailsResponse});

  @override
  List<Object?> get props => [exerciseDetailsResponse];
}

class RunningExerciseInitial extends RunningExerciseState {}

class GetExerciseItemDetailsState extends RunningExerciseState {
  Resource<ExerciseModel>? exerciseDetailsResponse;
  int? millisecond;
  String? gif;
  List<String>? instruction;

  GetExerciseItemDetailsState(
      {this.exerciseDetailsResponse,
      this.gif,
      });

  GetExerciseItemDetailsState? copyWith(
      {Resource<ExerciseModel>? exerciseDetailsResponse,
      int? millisecond,
      String? gif,
      List<String>? instruction}) {
    return GetExerciseItemDetailsState(
        exerciseDetailsResponse:
            exerciseDetailsResponse ?? this.exerciseDetailsResponse,
        gif: gif ?? this.gif);
  }

  @override
  List<Object?> get props =>
      [exerciseDetailsResponse,  gif];
}

final class StartTimeState extends RunningExerciseState {
  int? millisecond;
  StartTimeState({this.millisecond});
  @override
  List<Object?> get props =>
      [millisecond];
}

final class StopTimerState extends RunningExerciseState {}
