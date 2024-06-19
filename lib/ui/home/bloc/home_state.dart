import 'package:equatable/equatable.dart';
import 'package:sweat_smart/data/model/LoginUserModel.dart';
import 'package:sweat_smart/other/resource.dart';

class HomeState extends Equatable {
  Resource<LoginUserModel>? loginUserModel;
  HomeState({this.loginUserModel});

  HomeState copyWith( Resource<LoginUserModel>? loginUserModel){
    return HomeState(loginUserModel:loginUserModel ?? this.loginUserModel);
  }
  @override
  List<Object?> get props => [loginUserModel];

}