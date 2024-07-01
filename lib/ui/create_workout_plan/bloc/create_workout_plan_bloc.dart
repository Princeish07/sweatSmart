import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../repository/workout_plan_repository.dart';

part 'create_workout_plan_event.dart';
part 'create_workout_plan_state.dart';

class CreateWorkoutPlanBloc extends Bloc<CreateWorkoutPlanEvent, CreateWorkoutPlanState> {
  WorkoutPlanRepository? repository;
  CreateWorkoutPlanBloc({this.repository}) : super(CreateWorkoutInitialPlanState()) {
    on<CreateWorkoutPlanEvent>((event,emitter) async {
      if(event is FetchBodyPartListEvent){
        try {
            await repository?.getBodyPartList();
        } catch (e) {
          print(e);
        }
      }

      if(event is FetchExerciseListEvent) {
        try {
          await repository?.getExerciseList();
        } catch (e) {
          print(e);
        }
      }
    });
  }

  Future<void> _fetchBodyPartList(FetchBodyPartListEvent event, Emitter<GetBodyPartListState> emitter) async {



  }
  Future<void> _fetchExerciseList(FetchBodyPartListEvent event, Emitter<CreateWorkoutPlanState> emitter) async {
    try {
      var p = await repository?.getBodyPartList();
    } catch (e) {
      print(e);
    }


  }
}
