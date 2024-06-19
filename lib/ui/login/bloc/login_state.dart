import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:sweat_smart/other/resource.dart';

import '../../../data/model/LoginUserModel.dart';

class LoginState extends Equatable{
  String? success;
  Resource<LoginUserModel>? loginUserModel;

  LoginState({this.success,this.loginUserModel});

  LoginState copyWith({String? success,Resource<LoginUserModel>? loginUserModel}){
    return LoginState(success: success ?? this.success,loginUserModel: loginUserModel ?? this.loginUserModel);

  }

  @override
  List<Object?> get props => [success,loginUserModel];

}