import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweat_smart/ui/home/bloc/home_bloc.dart';
import 'package:sweat_smart/ui/home/bloc/home_state.dart';
import 'package:sweat_smart/ui/home/ui/value_and_placeholder.dart';

import '../bloc/home_event.dart';
import 'CardWithNumericAndString.dart';
class HealthDetail extends StatefulWidget {
  const HealthDetail({super.key});

  @override
  State<HealthDetail> createState() => _HealthDetailState();
}

class _HealthDetailState extends State<HealthDetail> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeApiState>(
      buildWhen: (old,new1){
        return old!=new1 && old.userHealthModel?.data !=null;
      },
  builder: (context, state) {

    return Container(
      child:
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWithNumericAndString(isCenteredAlign: true,value: (state.userHealthModel?.data?.totalSteps ?? 0).toString(),placeholder: "Steps",imageString: Icons.directions_walk,),
            SizedBox(width: 30,),
            CardWithNumericAndString(isCenteredAlign: true,value: (state.userHealthModel?.data?.totalCalories ?? 0).toString(),placeholder: "Calories",imageString: Icons.water_drop,)


          ],),
        const SizedBox(height: 15,),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Color(0x1AFFFFFF)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          ValueAndPlaceHolder(value:(state.userHealthModel?.data?.bloodOxygen ?? 0).toString(),placeHolder: "Blood Oxygen",isCenterAlign: false),



    ValueAndPlaceHolder(value:(state.userHealthModel?.data?.heartBeat ?? 0).toString(),placeHolder:"Heart Rate",isCenterAlign:false),


    ValueAndPlaceHolder(value:(state.userHealthModel?.data?.bodyTemperature ?? 0).toString(),placeHolder:"Body Temperature",isCenterAlign:false),

            ],
          ),
        )
      ],
    )
    );
  },
);
  }
}
