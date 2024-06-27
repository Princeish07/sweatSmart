import 'dart:ffi';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweat_smart/data/local/shared_pref/shared_preference.dart';
import 'package:sweat_smart/data/model/user_health_model.dart';
import 'package:sweat_smart/data/repository/home_repository_impl.dart';
import 'package:sweat_smart/other/resource.dart';
import 'package:sweat_smart/ui/common_loader/common_loader_helper.dart';
import 'package:sweat_smart/ui/home/bloc/home_event.dart';
import 'package:sweat_smart/ui/home/bloc/home_state.dart';
import 'package:sweat_smart/ui/home/repository/home_repository.dart';

import '../../../data/model/LoginUserModel.dart';
import '../../../data/model/foot_step.dart';
import '../../../other/service_locator/locator.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeRepository? homeRepository;
  Resource<LoginUserModel>? loginUserModel;
  Resource<List<FootSteps>>? footSteps;


  HomeBloc(this.homeRepository):super( HomeState()){
    on<GetLoggedInUserDetailEvent>(_getUserDetailsFromSharedPref);
    on<GetUserHealthDetails>(_getHealthDetails);
    on<LogoutUser>(_logoutUser);
    on<ResetStateEvent>(_resetState);

  }

  void _getUserDetailsFromSharedPref(GetLoggedInUserDetailEvent event, Emitter<HomeState> emitter)async{
    CommonLoaderHelper.showLoader(true);
    emitter(state.copyWith(loginUserModel: loginUserModel));

    Resource<String?>? userEmail = await homeRepository?.getUserDetailFromSharedPref();
    loginUserModel = Resource.success(data: LoginUserModel(email: userEmail?.data.toString()));
    emitter(state.copyWith(loginUserModel: loginUserModel));
    CommonLoaderHelper.showLoader(false);



  }

  void _getHealthDetails(GetUserHealthDetails event, Emitter<HomeState> emitter)async
  {

    UserHealthModel userHealthModel = UserHealthModel();
    CommonLoaderHelper.showLoader(true);

    // emitter(state.copyWith(userHealthModel: Resource.loading()));

    footSteps = await homeRepository?.getHealthDetails();
    if(footSteps!.data== null || footSteps!.data!.isEmpty){
      emitter(state.copyWith(userHealthModel: Resource.success(data: UserHealthModel())));
    }else{
    for(var i=0 ;i<footSteps!.data!.length;i++){
      if(footSteps!.data![i].unit=="COUNT") {
        userHealthModel.totalSteps = (userHealthModel.totalSteps! +int.parse(footSteps!.data![i].value));
      }else if(footSteps!.data![i].unit=="KILOCALORIE"){

        userHealthModel.totalCalories = (userHealthModel.totalCalories! + double.parse(footSteps!.data![i].value).toInt());

      }else if(footSteps!.data![i].unit=="BEATS_PER_MINUTE"){

        userHealthModel.heartBeat = (userHealthModel.heartBeat! +double.parse(footSteps!.data![i].value).toInt());

      }else if(footSteps!.data![i].unit=="DEGREE_CELSIUS"){
        userHealthModel.bodyTemperature = (userHealthModel.bodyTemperature! +double.parse(footSteps!.data![i].value).toInt());

      }else{
        userHealthModel.bloodOxygen = (userHealthModel.bloodOxygen! +double.parse(footSteps!.data![i].value).toInt());

      }

      userHealthModel;
    }

    emitter(state.copyWith(userHealthModel: Resource.success(data: userHealthModel)));}
    CommonLoaderHelper.showLoader(false);

  }
  void _logoutUser(LogoutUser event, Emitter<HomeState> emitter)async
  {
    emitter(state.copyWith(userHealthModel: Resource.loading()));

    var logoutUser = await homeRepository?.logoutUser();
    if(logoutUser?.status==Status.SUCCESS){
      emitter(state.copyWith(userHealthModel: Resource.success(),logoutResponse: logoutUser?.data));

    }
    if(logoutUser?.status==Status.FAILURE){
      emitter(state.copyWith(userHealthModel: Resource.failure(message: logoutUser?.message),logoutResponse: logoutUser?.data));

    }
  }

  void _resetState(ResetStateEvent event, Emitter<HomeState> emitter)async
  {
    emitter(state.copyWith(userHealthModel: Resource.loading(),loginUserModel: Resource.loading(),logoutResponse: false));
  }
}