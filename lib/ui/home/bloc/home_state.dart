import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:sweat_smart/data/model/LoginUserModel.dart';
import 'package:sweat_smart/data/model/workout_plan_model.dart';
import 'package:sweat_smart/other/resource.dart';

import '../../../data/model/alarm_model.dart';
import '../../../data/model/user_health_model.dart';

class HomeApiState extends Equatable {
  Resource<LoginUserModel>? loginUserModel;
  Resource<UserHealthModel>? userHealthModel;
  bool? logoutResponse;
  Resource<List<AlarmModel>>? alarmListResponse;
  bool? toggleValue = false;
  Resource<List<WorkoutPlanModel>>? workoutExerciseListResponse;
  HomeApiState(
      {this.loginUserModel,
      this.userHealthModel,
      this.logoutResponse,
      this.alarmListResponse,
      this.toggleValue,this.workoutExerciseListResponse});

  HomeApiState copyWith(
      {Resource<LoginUserModel>? loginUserModel,
      Resource<UserHealthModel>? userHealthModel,
      bool? logoutResponse,
      Resource<List<AlarmModel>>? alarmListResponse,
      bool? toggleValue,
      Resource<List<WorkoutPlanModel>>? workoutExerciseListResponse}) {
    return HomeApiState(
        loginUserModel: loginUserModel ?? this.loginUserModel,
        userHealthModel: userHealthModel ?? this.userHealthModel,
        logoutResponse: logoutResponse ?? this.logoutResponse,
        alarmListResponse: alarmListResponse ?? this.alarmListResponse,
        toggleValue: toggleValue ?? this.toggleValue,workoutExerciseListResponse: workoutExerciseListResponse ?? this.workoutExerciseListResponse);
  }

  @override
  List<Object?> get props => [
        loginUserModel,
        userHealthModel,
        logoutResponse,
        alarmListResponse,
        toggleValue,
    workoutExerciseListResponse
      ];
}
