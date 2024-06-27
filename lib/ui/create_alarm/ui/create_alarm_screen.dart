import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweat_smart/other/app_resource/AppColors.dart';
import 'package:sweat_smart/other/app_resource/AppDimen.dart';
import 'package:sweat_smart/other/app_resource/AppStyle.dart';
import 'package:sweat_smart/other/general_utils.dart';
import 'package:sweat_smart/ui/create_alarm/bloc/create_alarm_bloc.dart';
import 'package:sweat_smart/ui/create_alarm/ui/day_picker.dart';
import 'package:sweat_smart/ui/create_alarm/ui/time_picker.dart';
import 'package:sweat_smart/ui/home/bloc/home_bloc.dart';
import 'package:sweat_smart/ui/home/bloc/home_state.dart';

import '../../../other/resource.dart';

class CreateAlarmScreen extends StatefulWidget {
  const CreateAlarmScreen({super.key});

  @override
  State<CreateAlarmScreen> createState() => _CreateAlarmScreenState();
}

class _CreateAlarmScreenState extends State<CreateAlarmScreen> {
  TextEditingController targetCtrl = TextEditingController();
  TextEditingController alarmNameCtrl = TextEditingController();
  TextEditingController alarmSlider = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateAlarmBloc, CreateAlarmState>(
      listener: (context, state) {
        if(state.response?.status==Status.SUCCESS){
          showToast("Alarm Added", context);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: AppDimen.mainScreenVerticalPadding,
            horizontal: AppDimen.mainScreenHorizontalPadding),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,

            children: [
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: () {
                    Navigator.pop(context);
                  }, child: SvgPicture.asset(
                    "assets/images/ic_cross.svg",
                    height: 50,
                    width: 50,
                  ),),
                  InkWell(onTap: () {
                    context.read<CreateAlarmBloc>().add(SetAlarmEvent(
                        target: targetCtrl.text,
                        alarmName: alarmNameCtrl.text));
                  }, child: SvgPicture.asset(
                    "assets/images/ic_check.svg",
                    height: 50,
                    width: 50,
                  ),),

                ],
              ),
              SizedBox(height: 15,),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return Text(
                      "Welcome, ${state.loginUserModel?.data?.userName} ");
                },
              ),
              SizedBox(height: 15,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "What time do you want to exercise?",
                  style: AppStyles().profileHeadingStyle(Colors.black),
                ),
                WheelPickerExample(onTimeChange: (time) {
                  context.read<CreateAlarmBloc>().add(SetDateTimeEvent(time));
                },)
              ],
              ),
              SizedBox(height: 15,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Repeat",
                    style: AppStyles().largeSubHeadingStyle(Colors.black),
                  ),
                  DayPicker(selectedDays: (selectedDays) {
                    context.read<CreateAlarmBloc>().add(
                        SelectDayEvent(selectedDays));
                  }),
                ],
              ),
              SizedBox(height: 15,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Target",
                    style: AppStyles().greyRegularFontStyle(Colors.black),
                  ),
                  TextField(controller: targetCtrl,),
                ],
              ),
              SizedBox(height: 15,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alarm name",
                    style: AppStyles().greyRegularFontStyle(Colors.black),
                  ),
                  TextField(controller: alarmNameCtrl,),
                ],
              ),
              SizedBox(height: 15,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alarm sound",
                    style: AppStyles().greyRegularFontStyle(Colors.black),
                  ),
                  const TextField(decoration: InputDecoration(
                      hintText: "Select File",
                      hintStyle: TextStyle(color: Color(AppColors.grayText))),),
                ],
              ),
              SizedBox(height: 15,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alarm volume",
                    style: AppStyles().greyRegularFontStyle(Colors.black),
                  ),
                  BlocBuilder<CreateAlarmBloc, CreateAlarmState>(
                    builder: (context, state) {
                      return Slider(
                        max: 1.0,
                        min: 0,
                        value: state.sliderValue ?? 0.3, onChanged: (value) {
                        context.read<CreateAlarmBloc>().add(
                            ChangeSlider(value));
                      }, activeColor: Color(AppColors.lightPink),);
                    },
                  ),

                ],
              ),

            ],
          ),
        ),

      ),
    );
  }
}
