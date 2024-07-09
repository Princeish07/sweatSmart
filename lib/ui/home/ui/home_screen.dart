
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pushupcount/views/pose_detection_view.dart';
import 'package:sweat_smart/other/app_resource/AppDimen.dart';
import 'package:sweat_smart/other/app_resource/AppStyle.dart';
import 'package:sweat_smart/ui/common_loader/bloc/common_loader_bloc.dart';
import 'package:sweat_smart/ui/common_loader/common_loader_helper.dart';
import 'package:sweat_smart/ui/create_alarm/ui/create_alarm_screen.dart';
import 'package:sweat_smart/ui/create_workout_plan/bloc/create_workout_plan_bloc.dart';
import 'package:sweat_smart/ui/create_workout_plan/ui/create_workout_plan_screen.dart';
import 'package:sweat_smart/ui/home/bloc/home_bloc.dart';
import 'package:sweat_smart/ui/home/bloc/home_event.dart';
import 'package:sweat_smart/ui/home/ui/CardWithNumericAndString.dart';
import 'package:sweat_smart/ui/home/ui/alarm_list.dart';
import 'package:sweat_smart/ui/home/ui/health_detail.dart';
import 'package:sweat_smart/ui/home/ui/warm_up_excercise_list.dart';
import 'package:sweat_smart/ui/home/ui/workout_plan_list.dart';
import 'package:sweat_smart/ui/login/login_screen.dart';
import 'package:sweat_smart/ui/running_excercise/ui/running_excercise_screen.dart';

import '../../../main.dart';
import '../../../other/app_resource/AppColors.dart';
import '../../../other/resource.dart';
import '../../common_loader/ui/common_loader_screen.dart';
import '../bloc/home_state.dart';
import 'my_alarm_plan.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) async {
       context.read<HomeBloc>().add(GetLoggedInUserDetailEvent());
       context.read<HomeBloc>().add(GetUserHealthDetails());

       context.read<HomeBloc>().add(FetchExerciseList());

    });


  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommonLoaderBloc, CommonLoaderState>(
  builder: (context, loaderState) {

          return SafeArea(
            child: Stack(children: [
              Scaffold(
                // appBar: AppBar(actions: [IconButton(onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> PoseDetectorView()));
                // }, icon: const Icon(Icons.camera))],),
                // floatingActionButton: Container(
                //   decoration: const BoxDecoration(
                //     gradient: LinearGradient(
                //       colors: [
                //         Color(AppColors.lightPink),
                //         Color(AppColors.darkPink),
                //       ],
                //     ),
                //     shape: BoxShape.circle,
                //   ),
                //   child: FloatingActionButton(
                //       onPressed: () {
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateWorkOutPlanScreen()));
                //       },
                //       backgroundColor: Colors.transparent,
                //       elevation: 0,
                //       child: Icon(
                //         Icons.home,
                //         color: Colors.white,
                //       )),
                // ),
                body: BlocListener<HomeBloc, HomeApiState>(
                  listener: (context, state) {
                    if (state.logoutResponse == true) {
                      context.read<HomeBloc>().add(ResetStateEvent());

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) => false);
                    }
                  },
                  child: BlocBuilder<HomeBloc, HomeApiState>(
                    buildWhen: (old, new1) {
                      return old != new1;
                    },
                    builder: (context, state) {
                      return

                          LayoutBuilder(
                              builder: (context, BoxConstraints constraints) {
                                return Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical:
                                          AppDimen.mainScreenVerticalPadding,
                                          horizontal:
                                          AppDimen.mainScreenHorizontalPadding),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/ic_bg.png"),
                                              fit: BoxFit.fill)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              if (state.loginUserModel?.status !=
                                                  Status.FAILURE) ...[
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        state.loginUserModel!.data!
                                                            .email
                                                            .toString(),
                                                        style: AppStyles()
                                                            .greyRegularFontStyle(
                                                            Color(AppColors
                                                                .grayText))),
                                                    Text(
                                                      "Prince Sharma",
                                                      style: AppStyles()
                                                          .profileHeadingStyle(
                                                          Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ],
                                              InkWell(
                                                onTap: () {
                                                  context
                                                      .read<HomeBloc>()
                                                      .add(LogoutUser());
                                                },
                                                child: CircleAvatar(
                                                  child: Image.asset(
                                                      "assets/images/ic_profile.png"),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          HealthDetail(),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: constraints.maxHeight / 1.75,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(AppColors.grayBorder)),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(24),
                                                topRight: Radius.circular(24)),
                                            color: Colors.white),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              const WarmUpExcerciseList(),
                                              MyAlarmPlan(
                                                onAddReminderClick: () {
                                                  print("Helllo called");

                                                  showModalBottomSheet<void>(
                                                      context: context,
                                                      isScrollControlled: true,
                                                      builder: (context) {
                                                        return CreateAlarmScreen();
                                                      });
                                                },
                                              ),

                                              AlarmList(),
                                              SizedBox(height: 15,),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: AppDimen.mainScreenHorizontalPadding),
                                                child: Text("My Workout Plan",style: AppStyles().largeSubHeadingStyle(Colors.black),textAlign: TextAlign.start,),
                                              ),
                                              const Align(child: WorkoutPlanList())

                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              });

                    },
                  ),
                ),
              ),
              if(loaderState is ShowLoaderState) CommonLoader()

            ]),
          );
        }

);
  }


}
