import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sweat_smart/data/local/shared_pref/shared_pref_key.dart';
import 'package:sweat_smart/other/general_utils.dart';
import 'package:sweat_smart/ui/login/bloc/login_event.dart';
import 'package:sweat_smart/ui/login/bloc/login_state.dart';

import '../../../data/local/shared_pref/shared_preference.dart';
import '../../../data/model/LoginUserModel.dart';
import '../../../other/resource.dart';
import '../../../other/schedule_alarm.dart';
import '../repository/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository? loginRepository;
  Resource<LoginUserModel>? loginUserModel;

  LoginBloc(this.loginRepository) : super(LoginState()) {
    on<LoggedInEvent>(_login);
  }

  void _login(LoggedInEvent event, Emitter<LoginState> emitter) async {
    _validationCheck(event);
    if (loginUserModel?.status == Status.SUCCESS) {
      loginUserModel = Resource.loading();
      emitter(state.copyWith(success: "Hello", loginUserModel: loginUserModel));

      loginUserModel = await loginRepository?.loginWithEmail(
          event.email.toString(), event.password.toString());
      if (loginUserModel?.status == Status.SUCCESS) {
        await PreferenceUtils.setString(
            SharedPrefKey.userEmail, loginUserModel!.data!.email.toString());

        emitter(
            state.copyWith(success: "Success", loginUserModel: loginUserModel));
      } else {
        emitter(
            state.copyWith(success: "Failed", loginUserModel: loginUserModel));
      }
    } else {
      emitter(
          state.copyWith(success: "Success", loginUserModel: loginUserModel));
    }
  }

  void _validationCheck(LoggedInEvent event) {
    if (event.email.toString().isEmpty) {
      loginUserModel = Resource.failure(message: "Please enter email");
    } else if (!event.email.toString().isValidEmail()) {
      loginUserModel = Resource.failure(message: "Please enter valid email");
    } else if (event.password.toString().isEmpty) {
      loginUserModel = Resource.failure(message: "Please enter password");
    } else {
      loginUserModel = Resource.success();
    }
  }
}
