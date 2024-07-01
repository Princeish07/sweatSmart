import 'package:sweat_smart/data/model/alarm_model.dart';

import '../../../data/model/foot_step.dart';
import '../../../other/resource.dart';

abstract class HomeRepository{
  Future<Resource<String?>> getUserDetailFromSharedPref();
  Future<Resource<List<FootSteps>>> getHealthDetails();

  Future<Resource<bool>> logoutUser();

  Future<Resource<List<AlarmModel>>> fetchAlarmList();

}