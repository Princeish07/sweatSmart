import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweat_smart/data/model/user_health_model.dart';
import 'package:sweat_smart/data/repository/home_repository_impl.dart';
import 'package:sweat_smart/other/resource.dart';
import 'package:sweat_smart/ui/home/bloc/home_event.dart';
import 'package:sweat_smart/ui/home/bloc/home_state.dart';
import 'package:sweat_smart/ui/home/repository/home_repository.dart';

import '../../../data/model/LoginUserModel.dart';
import '../../../data/model/foot_step.dart';
import '../../../other/service_locator/locator.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeRepository? homeRepository;
  Resource<LoginUserModel>? loginUserModel;
  List<FootSteps>? footSteps;


  HomeBloc(this.homeRepository):super( HomeState()){
    on<GetLoggedInUserDetailEvent>(_getUserDetailsFromSharedPref);

  }

  void _getUserDetailsFromSharedPref(GetLoggedInUserDetailEvent event, Emitter<HomeState> emitter)async{
    loginUserModel = Resource.loading();
    emitter(state.copyWith(loginUserModel));
    footSteps = await homeRepository?.getHealthDetails();

    Resource<String?>? userEmail = await homeRepository?.getUserDetailFromSharedPref();
    loginUserModel = Resource.success(data: LoginUserModel(email: userEmail?.data.toString()));
    emitter(state.copyWith(loginUserModel));
    _getHealthDetails(event,emitter);


  }

  void _getHealthDetails(GetLoggedInUserDetailEvent event, Emitter<HomeState> emitter)async
  {
    UserHealthModel userHealthModel = UserHealthModel();
    footSteps = await homeRepository?.getHealthDetails();
    for(var i=0 ;i<footSteps!.length;i++){
      if(footSteps![i].unit=="COUNT") {
        userHealthModel.totalSteps = (userHealthModel.totalSteps! +int.parse(footSteps![i].value));
      }


    }

  }


}