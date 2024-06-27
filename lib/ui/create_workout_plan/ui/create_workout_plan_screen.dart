import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sweat_smart/other/app_resource/AppDimen.dart';

import '../../../other/app_resource/AppStyle.dart';
class CreateWorkOutPlanScreen extends StatefulWidget {
  const CreateWorkOutPlanScreen({super.key});

  @override
  State<CreateWorkOutPlanScreen> createState() => _CreateWorkOutPlanScreenState();
}

class _CreateWorkOutPlanScreenState extends State<CreateWorkOutPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return       Container(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.mainScreenVerticalPadding,horizontal: AppDimen.mainScreenHorizontalPadding),
      child: Column(
        children: [
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
                Navigator.pop(context);

              }, child: SvgPicture.asset(
                "assets/images/ic_check.svg",
                height: 50,
                width: 50,
              ),),

            ],
          ),
          SizedBox(height: 15,),
          Text(
            "Create Workout Plan",
            style: AppStyles().profileHeadingStyle(Colors.black),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Excercise Name",
                style: AppStyles().greyRegularFontStyle(Colors.black),
              ),
              TextField(),
            ],
          ),



        ],
      ),
    );
  }
}
