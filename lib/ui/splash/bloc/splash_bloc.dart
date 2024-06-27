import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sweat_smart/data/local/shared_pref/shared_pref_key.dart';
import 'package:sweat_smart/other/resource.dart';

import '../../../data/local/shared_pref/shared_preference.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<CheckIsAuthenticatedEvent>(_isAuthenticated);
  }

  Future<void> _isAuthenticated(CheckIsAuthenticatedEvent event, Emitter<SplashState> emitter) async {
    try {
      String isAuthenticated = await PreferenceUtils.getString(SharedPrefKey.userEmail);
      // Timer(
      //   Duration(seconds: 2),
      //       () {
              if(isAuthenticated!=null && isAuthenticated.isNotEmpty){
                emitter(state.copyWith(isAuthenticated: Resource.success(data: true)));
              }else       {
                emitter(state.copyWith(isAuthenticated: Resource.success(data: false)));


              }
      //
      //       },
      // );
    } catch (e) {
      emitter(state.copyWith(isAuthenticated: Resource.failure(message: e.toString())));
    }
  }
}
