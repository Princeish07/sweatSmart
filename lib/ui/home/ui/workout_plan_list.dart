import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:sweat_smart/data/model/alarm_model.dart';
import 'package:sweat_smart/data/model/workout_plan_model.dart';
import 'package:sweat_smart/other/app_resource/AppDimen.dart';
import 'package:sweat_smart/other/app_resource/AppStyle.dart';
import 'package:sweat_smart/ui/home/bloc/home_bloc.dart';
import 'package:sweat_smart/ui/home/bloc/home_event.dart';
import 'package:sweat_smart/ui/home/bloc/home_state.dart';
import 'package:sweat_smart/ui/home/ui/warm_up_excercise_list.dart';

import '../../../other/app_resource/AppColors.dart';
import '../../../other/general_utils.dart';
import '../../../other/resource.dart';
import '../../running_excercise/ui/running_excercise_screen.dart';
class WorkoutPlanList extends StatefulWidget {
  const WorkoutPlanList({super.key});

  @override
  State<WorkoutPlanList> createState() => _WorkoutPlanListState();
}

class _WorkoutPlanListState extends State<WorkoutPlanList> {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeApiState>(
  builder: (context, state)
    {

      if (state.workoutExerciseListResponse != null && state.workoutExerciseListResponse?.status == Status.SUCCESS &&
          !state.workoutExerciseListResponse!.data!.isEmpty){
        return Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimen.mainScreenHorizontalPadding),

            height: 200,
            child: GridView.builder(
                itemCount: state.workoutExerciseListResponse?.data?.length,
                itemBuilder: (context, index) {


                  WorkoutPlanModel? value = state.workoutExerciseListResponse?.data?[index];


                  return
                    GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RunningExcerciseScreen(
                                    millisecond:
                                    StopWatchTimer.getMilliSecFromMinute(value.duration!.inMinutes),
                                    gif: value.exercise?.gif.toString(),
                                    id: value.exercise?.id.toString(),
                                    isApiRequired: true,
                                  )));
                        },
                        child: ExcerciseListItem(value: value!.duration!.inMinutes.toString(), name: value!.exercise!.exerciseName.toString(), icon: value!.exercise!.gif.toString(),));
                },   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                )
        );
    }else{
      return  Center(child: Text("No Data Found"),);
      }
  },
);
  }
}
