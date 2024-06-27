import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


part 'running_exercise_event.dart';
part 'running_exercise_state.dart';

class RunningExerciseBloc extends Bloc<RunningExerciseEvent, RunningExerciseState> {
  RunningExerciseBloc() : super(RunningExerciseInitial()) {
    on<StartTimerEvent>((event, emit) {

    });
  }

  void _startTime(){

  }

  void _stopTime(){

  }
}
