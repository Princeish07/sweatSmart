import 'package:sweat_smart/data/model/ExerciseModel.dart';
import 'package:sweat_smart/data/model/alarm_model.dart';

import '../../../data/model/foot_step.dart';
import '../../../data/model/workout_plan_model.dart';
import '../../../other/resource.dart';

abstract class HomeRepository{
  Future<Resource<String?>> getUserDetailFromSharedPref();
  Future<Resource<List<FootSteps>>> getHealthDetails();

  Future<Resource<bool>> logoutUser();

  Future<Resource<List<AlarmModel>>> fetchAlarmList();
  Future<Resource<List<WorkoutPlanModel>>> fetchExerciseList();

}