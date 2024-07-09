import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sweat_smart/data/model/ExerciseModel.dart';
import 'package:sweat_smart/other/resource.dart';

import '../../common_loader/common_loader_helper.dart';
import '../repository/exercise_repository.dart';


part 'running_exercise_event.dart';
part 'running_exercise_state.dart';

class RunningExerciseBloc extends Bloc<RunningExerciseEvent, RunningExerciseState> {
ExerciseRepository? repository;
  RunningExerciseBloc({this.repository}) : super(RunningExerciseInitial()) {
    on<StartTimerEvent>((event, emit) {

    });

    on<GetDetailsOfExerciseEvent>((event, emit) async{
      CommonLoaderHelper.showLoader(true);

      Resource<ExerciseModel>?  exerciseModel = await repository?.fetchExerciseDetails(event.id);
      emit(GetExerciseItemDetailsState(exerciseDetailsResponse: exerciseModel,gif: exerciseModel?.data?.gif));
      CommonLoaderHelper.showLoader(false);

    });
  }

  void _startTime(){

  }

  void _stopTime(){

  }
}
