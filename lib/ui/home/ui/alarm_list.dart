import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweat_smart/data/model/alarm_model.dart';
import 'package:sweat_smart/other/app_resource/AppDimen.dart';
import 'package:sweat_smart/other/app_resource/AppStyle.dart';
import 'package:sweat_smart/ui/home/bloc/home_bloc.dart';
import 'package:sweat_smart/ui/home/bloc/home_event.dart';
import 'package:sweat_smart/ui/home/bloc/home_state.dart';

import '../../../other/app_resource/AppColors.dart';
import '../../../other/general_utils.dart';
import '../../../other/resource.dart';
class AlarmList extends StatefulWidget {
  const AlarmList({super.key});

  @override
  State<AlarmList> createState() => _AlarmListState();
}

class _AlarmListState extends State<AlarmList> {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeApiState>(
  builder: (context, state)
    {

      if (state.alarmListResponse != null && state.alarmListResponse?.status == Status.SUCCESS &&
          !state.alarmListResponse!.data!.isEmpty){
        return Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimen.mainScreenHorizontalPadding),

            height: 200,
            child: ListView.builder(
                itemCount: state.alarmListResponse?.data?.length,
                itemBuilder: (context, index) {


                  AlarmModel? value = state.alarmListResponse?.data?[index];


                  return
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(border: Border.all(
                          color: const Color(AppColors.grayBorder)),
                          borderRadius: const BorderRadius.all(Radius.circular(20))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/images/ic_alarm_list.svg"),
                            const SizedBox(width: 15,),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${formattedTimeAMPM(value!.time,context)}",
                                    style: AppStyles().regularFontStyle(Colors
                                        .black),),
                                  Text(value!.target!.toString(),
                                      style: AppStyles().greySmallFontStyle(
                                          const Color(AppColors.grayText)))

                                ]),

                          ],
                        ),
                      )
                  );
                })
        );
    }else{
      return  Center(child: Text("No Data Found"),);
      }
  },
);
  }
}
