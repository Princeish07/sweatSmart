import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:sweat_smart/data/model/LoginUserModel.dart';
import 'package:sweat_smart/other/resource.dart';

import '../../../data/model/user_health_model.dart';

class HomeState extends Equatable {
  Resource<LoginUserModel>? loginUserModel;
  Resource<UserHealthModel>? userHealthModel;
  bool? logoutResponse;

  HomeState({this.loginUserModel,this.userHealthModel,this.logoutResponse});

  HomeState copyWith(
      {Resource<LoginUserModel>? loginUserModel,
        Resource<UserHealthModel>? userHealthModel,bool? logoutResponse}){
    return HomeState(loginUserModel:loginUserModel ?? this.loginUserModel,userHealthModel: userHealthModel ?? this.userHealthModel,logoutResponse: logoutResponse ?? this.logoutResponse);
  }
  @override
  List<Object?> get props => [loginUserModel,userHealthModel,logoutResponse];

}