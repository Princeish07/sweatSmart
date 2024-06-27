
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweat_smart/ui/common_loader/bloc/common_loader_bloc.dart';

import '../../other/service_locator/locator.dart';
import '../home/bloc/home_bloc.dart';

class CommonLoaderHelper{
  static showLoader(bool value){
    try {
      serviceLocator.get<CommonLoaderBloc>().add(value ? ShowLoaderEvent() : HideLoaderEvent());
    } catch (e) {
      print(e);
    }

  }
}