import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_workout_plan_event.dart';
part 'create_workout_plan_state.dart';

class CreateWorkoutPlanBloc extends Bloc<CreateWorkoutPlanEvent, CreateWorkoutPlanState> {
  CreateWorkoutPlanBloc() : super(CreateWorkoutPlanInitial()) {
    on<CreateWorkoutPlanEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
