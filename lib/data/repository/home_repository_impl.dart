import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health/health.dart';
import 'package:sweat_smart/data/local/shared_pref/shared_pref_key.dart';
import 'package:sweat_smart/data/local/shared_pref/shared_preference.dart';
import 'package:sweat_smart/data/model/ExerciseModel.dart';
import 'package:sweat_smart/data/model/workout_plan_model.dart';
import 'package:sweat_smart/other/resource.dart';
import 'package:sweat_smart/ui/home/repository/home_repository.dart';

import '../../other/service_locator/locator.dart';
import '../model/alarm_model.dart';
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
  Future<Resource<List<FootSteps>>> getHealthDetails() async {
    try {
      bool requested = await health.requestAuthorization([HealthDataType.STEPS,HealthDataType.TOTAL_CALORIES_BURNED,HealthDataType.BLOOD_OXYGEN,HealthDataType.HEART_RATE,HealthDataType.BODY_TEMPERATURE]);
      if (requested) {
            DateTime now = DateTime.now();

            // Get the start of today (midnight)
            DateTime startOfToday = DateTime(now.year, now.month, now.day);

            // Get the end of today (just before midnight of the next day)
            DateTime endOfToday = DateTime(now.year, now.month, now.day, 23, 59, 59);      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
                startTime:startOfToday,
               endTime:  endOfToday, types: [HealthDataType.STEPS,HealthDataType.TOTAL_CALORIES_BURNED,HealthDataType.BLOOD_OXYGEN,HealthDataType.HEART_RATE,HealthDataType.BODY_TEMPERATURE],includeManualEntry: true);
            print("Health Date Set"+healthData.toSet().toString());
             dynamic list = healthData.map((e) {
              var b = e;
              return FootSteps(
                value:b.value.toJson()["numeric_value"].toString(),
               unit: b.unitString,
               dateFrom:  b.dateFrom,
               dateTo:  b.dateTo,
              );
            }).toList();

            return Resource.success(data: list);
          }
      return Resource.success(data: []);
    } catch (e) {
      return Resource.failure(message: e.toString());
    }
  }


  Future<Resource<bool>> logoutUser() async {
    try {
     bool? isSuccess =  await PreferenceUtils.clearPref();
     if(isSuccess==true) {
       return Resource.success(data: isSuccess);
     }else{
       return Resource.failure(message: "Failed to clear shared pref");

     }
    } catch (e) {
      return Resource.failure(message: "Failed to clear shared pref + ${e.toString()}");

    }
  }

  @override
  Future<Resource<List<AlarmModel>>> fetchAlarmList() async {
    try {
      // Reference to Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      CollectionReference myAlarmCollection = firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('my_alarm');

      QuerySnapshot querySnapshot = await myAlarmCollection.get();

      List<AlarmModel> alarms = querySnapshot.docs
          .map((doc) => AlarmModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();


      return Resource.success(data: alarms);
    } catch (e) {
      // Handle errors
      print("Error fetching alarms: $e");
      return Resource.failure(message: e.toString());

    }
  }

  @override
  Future<Resource<List<WorkoutPlanModel>>> fetchExerciseList() async {
    try {
      // Reference to Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      CollectionReference myWorkoutPlanRef = firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('my_workout_plan');

      QuerySnapshot querySnapshot = await myWorkoutPlanRef.get();

      List<WorkoutPlanModel> workoutPlans = querySnapshot.docs
          .map((doc) => WorkoutPlanModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();


      return Resource.success(data: workoutPlans);
    } catch (e) {
      // Handle errors
      print("Error fetching alarms: $e");
      return Resource.failure(message: e.toString());

    }
  }





}