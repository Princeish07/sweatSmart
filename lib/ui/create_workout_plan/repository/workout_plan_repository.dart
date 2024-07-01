import 'package:sweat_smart/data/repository/workout_plan_repository_impl.dart';

import '../../../data/model/BodyPartModel.dart';
import '../../../other/resource.dart';

abstract class WorkoutPlanRepository{
  Future<Resource<List<String>>> getBodyPartList();

  Future<void> getExerciseList();

}