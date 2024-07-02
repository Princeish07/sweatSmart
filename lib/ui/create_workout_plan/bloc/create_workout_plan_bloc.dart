import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sweat_smart/data/model/ExerciseModel.dart';

import '../../../other/resource.dart';
import '../../common_loader/common_loader_helper.dart';
import '../repository/workout_plan_repository.dart';

part 'create_workout_plan_event.dart';
part 'create_workout_plan_state.dart';

class CreateWorkoutPlanBloc extends Bloc<CreateWorkoutPlanEvent, CreateWorkoutPlanState> {
  WorkoutPlanRepository? repository;
  Resource<List<String>>? bodyPartList;
  Resource<List<ExerciseModel>>? exerciseList;

  CreateWorkoutPlanBloc({this.repository}) : super(CreateWorkoutPlanState()) {
    on<CreateWorkoutPlanEvent>((event,emitter) async {
      CommonLoaderHelper.showLoader(true);

      if(event is FetchBodyPartListEvent){
        try {

           bodyPartList = await repository?.getBodyPartList();
            // emitter(GetBodyPartListState(selectedBodyItemList: bodyPartList));
          emitter(state.copyWith(selectedBodyItemList: bodyPartList));
           CommonLoaderHelper.showLoader(false);
        } catch (e) {
          print(e);
        }
      }

      if(event is FetchExerciseListEvent) {

      }

      if(event is BodyItemDropdownEvent){
        emitter(state.copyWith(selectedBodyItem: event.selectedValue,selectedExerciseItem: ExerciseModel(exerciseName: "Select"),selectedExerciseItemList: Resource.success(data: [ExerciseModel(exerciseName: "Select")])));
        CommonLoaderHelper.showLoader(true);

        try {
          exerciseList = await repository?.getExerciseList(bodyPart: event.selectedValue);
          emitter(state.copyWith(selectedExerciseItemList: exerciseList));

          CommonLoaderHelper.showLoader(false);

        } catch (e) {
          print(e);
          CommonLoaderHelper.showLoader(false);

        }
        CommonLoaderHelper.showLoader(false);

      }
      if(event is ExerciseItemDropdownEvent){
        emitter(state.copyWith(selectedExerciseItem: event.selectedValue));
        CommonLoaderHelper.showLoader(false);
      }

      if(event is PriorityItemDropdownEvent){
        emitter(state.copyWith(selectedPriority: event.selectedValue));
        CommonLoaderHelper.showLoader(false);

      }

      if(event is AddWorkoutPlanEvent){
        print(state.selectedPriority);
        print(state.selectedExerciseItem?.exerciseName);
        print(state.selectedBodyItem);
        print(state.duration?.inMinutes);

        CommonLoaderHelper.showLoader(false);

      }

      if(event is TimerDurationUpdateEvent){
        emitter(state.copyWith(duration: event.duration));
        CommonLoaderHelper.showLoader(false);

      }
    });



  }


  // Future<void> _fetchBodyPartList(FetchBodyPartListEvent event, Emitter<GetBodyPartListState> emitter) async {
  //
  //
  //
  // }
  // Future<void> _fetchExerciseList(FetchBodyPartListEvent event, Emitter<CreateWorkoutPlanState> emitter) async {
  //   try {
  //     var p = await repository?.getBodyPartList();
  //   } catch (e) {
  //     print(e);
  //   }
  //
  //
  // }
}
