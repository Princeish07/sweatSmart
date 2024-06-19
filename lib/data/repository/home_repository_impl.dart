import 'package:health/health.dart';
import 'package:sweat_smart/data/local/shared_pref/shared_pref_key.dart';
import 'package:sweat_smart/data/local/shared_pref/shared_preference.dart';
import 'package:sweat_smart/other/resource.dart';
import 'package:sweat_smart/ui/home/repository/home_repository.dart';

import '../../other/service_locator/locator.dart';
import '../model/foot_step.dart';

class HomeRepositoryImpl extends HomeRepository{

  @override
  Future<Resource<String?>> getUserDetailFromSharedPref() async{
    try {
      String username = await PreferenceUtils.getString(SharedPrefKey.userEmail);
      return Resource.success(data: username);
    } catch (e) {
      return Resource.failure();
    }
  }



  final health = Health();
  Future<List<FootSteps>> getHealthDetails() async {
    bool requested = await health.requestAuthorization([HealthDataType.STEPS,HealthDataType.TOTAL_CALORIES_BURNED,HealthDataType.BLOOD_GLUCOSE,HealthDataType.HEART_RATE,HealthDataType.BODY_TEMPERATURE]);
    if (requested) {
      DateTime now = DateTime.now();

      // Get the start of today (midnight)
      DateTime startOfToday = DateTime(now.year, now.month, now.day);

      // Get the end of today (just before midnight of the next day)
      DateTime endOfToday = DateTime(now.year, now.month, now.day, 23, 59, 59);      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          startTime:startOfToday,
         endTime:  endOfToday, types: [HealthDataType.STEPS,HealthDataType.TOTAL_CALORIES_BURNED,HealthDataType.BLOOD_GLUCOSE,HealthDataType.HEART_RATE,HealthDataType.BODY_TEMPERATURE],includeManualEntry: true);
      print("Health Date Set"+healthData.toSet().toString());
      return healthData.map((e) {
        var b = e;
        return FootSteps(
          value:b.value.toJson()["numeric_value"].toString(),
         unit: b.unitString,
         dateFrom:  b.dateFrom,
         dateTo:  b.dateTo,
        );
      }).toList();
    }
    return [];
  }



}