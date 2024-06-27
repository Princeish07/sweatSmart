import 'package:flutter/material.dart';
import 'package:sweat_smart/other/app_resource/AppColors.dart';
import 'package:sweat_smart/other/app_resource/AppDimen.dart';
import 'package:sweat_smart/other/app_resource/AppStyle.dart';
class MyAlarmPlan extends StatefulWidget {
  void Function()? onAddReminderClick;
   MyAlarmPlan({super.key,this.onAddReminderClick});

  @override
  State<MyAlarmPlan> createState() => _MyAlarmPlanState();
}

class _MyAlarmPlanState extends State<MyAlarmPlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: AppDimen.mainScreenHorizontalPadding),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("My Alarm Plan",style: AppStyles().largeSubHeadingStyle(Colors.black),textAlign: TextAlign.start,),
            IconButton(onPressed: ()=>widget.onAddReminderClick!(), icon: Icon(Icons.alarm_add,color: Color(AppColors.darkPink),))
          ],
        )
      ],),
    );
  }
}
