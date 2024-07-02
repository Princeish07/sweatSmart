import 'package:sweat_smart/data/repository/workout_plan_repository_impl.dart';

import '../../../data/model/ExerciseModel.dart';
import '../../../other/resource.dart';

abstract class WorkoutPlanRepository{
  Future<Resource<List<String>>> getBodyPartList();

  Future<Resource<List<ExerciseModel>>> getExerciseList({String? bodyPart});

  Future<Resource<List<ExerciseModel>>> savePlanInDB({String? bodyPart});


}