part of 'running_exercise_bloc.dart';

abstract class RunningExerciseEvent extends Equatable {}

class StartTimerEvent extends RunningExerciseEvent{
  double? millisecond;
  StartTimerEvent({this.millisecond});

  @override
  List<Object?> get props => [millisecond];

}

class StopTimerEvent extends RunningExerciseEvent{


  @override
  List<Object?> get props => [];

}

class GetDetailsOfExerciseEvent extends RunningExerciseEvent{
  String? id;
  GetDetailsOfExerciseEvent({this.id});


  @override
  List<Object?> get props => [id];

}