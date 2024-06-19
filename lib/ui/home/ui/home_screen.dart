
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweat_smart/other/app_resource/AppDimen.dart';
import 'package:sweat_smart/other/app_resource/AppStyle.dart';
import 'package:sweat_smart/ui/home/bloc/home_bloc.dart';
import 'package:sweat_smart/ui/home/bloc/home_event.dart';
import 'package:sweat_smart/ui/home/ui/CardWithNumericAndString.dart';

import '../../../other/app_resource/AppColors.dart';
import '../../../other/resource.dart';
import '../bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetLoggedInUserDetailEvent());

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.loginUserModel==null || state.loginUserModel?.status.name == Status.LOADING.name) {
              return  Container(
                  child: const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.cyan,
                        color: Colors.red,
                      )));
            }else {
              return Container(

                padding: const EdgeInsets.symmetric(vertical: AppDimen.mainScreenVerticalPadding,horizontal: AppDimen.mainScreenHorizontalPadding),
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/ic_bg.png"),fit: BoxFit.fill)),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.loginUserModel!.data!.email.toString(),style: AppStyles().greyRegularFontStyle(Color(AppColors.grayText))),
                            Text("Prince Sharma",style: AppStyles().profileHeadingStyle(Colors.white),)
                          ],
                        ),
                        CircleAvatar(
                          child: Image.asset("assets/images/ic_profile.png"),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      CardWithNumericAndString(isCenteredAlign: true,value: "251",placeholder: "Steps",imageString: Icons.directions_walk,),
                      SizedBox(width: 30,),
                      CardWithNumericAndString(isCenteredAlign: true,value: "2500",placeholder: "Calories",imageString: Icons.water_drop,)


                    ],),
                    const SizedBox(height: 20,),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Color(0x1AFFFFFF)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          valueAndPlaceholderAtBottom("21","Like",false),
                          valueAndPlaceholderAtBottom("456","Following",false),
                          valueAndPlaceholderAtBottom("235","Calories",false),

                        ],
                      ),
                    )


                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
  Widget valueAndPlaceholderAtBottom(String value, String placeholder,bool isCenterAlign){
    return Column(
      crossAxisAlignment: isCenterAlign ? CrossAxisAlignment.center   : CrossAxisAlignment.start
      ,children: [
      Text(value,style: AppStyles().regularFontStyle(Colors.white)),
      Text(placeholder,style: AppStyles().greySmallFontStyle(Colors.white))

    ],);
  }


}
