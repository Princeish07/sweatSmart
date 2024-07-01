import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:sweat_smart/data/model/LoginUserModel.dart';
import 'package:sweat_smart/other/resource.dart';

import '../../../data/model/alarm_model.dart';
import '../../../data/model/user_health_model.dart';

class HomeApiState extends Equatable {
  Resource<LoginUserModel>? loginUserModel;
  Resource<UserHealthModel>? userHealthModel;
  bool? logoutResponse;
  Resource<List<AlarmModel>>? alarmListResponse;
  bool?  toggleValue = false;



  HomeApiState({this.loginUserModel,this.userHealthModel,this.logoutResponse,this.alarmListResponse,this.toggleValue});

  HomeApiState copyWith(
      {Resource<LoginUserModel>? loginUserModel,
        Resource<UserHealthModel>? userHealthModel,bool? logoutResponse,Resource<List<AlarmModel>>? alarmListResponse,bool? toggleValue}){
    return HomeApiState(loginUserModel:loginUserModel ?? this.loginUserModel,userHealthModel: userHealthModel ?? this.userHealthModel,logoutResponse: logoutResponse ?? this.logoutResponse,alarmListResponse: alarmListResponse ?? this.alarmListResponse,toggleValue: toggleValue ?? this.toggleValue);
  }
  @override
  List<Object?> get props => [loginUserModel,userHealthModel,logoutResponse,alarmListResponse,toggleValue];

}

