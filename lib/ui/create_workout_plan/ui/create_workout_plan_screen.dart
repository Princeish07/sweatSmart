import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sweat_smart/data/model/ExerciseModel.dart';
import 'package:sweat_smart/other/app_resource/AppDimen.dart';
import 'package:sweat_smart/ui/common_loader/bloc/common_loader_bloc.dart';
import 'package:sweat_smart/ui/create_workout_plan/bloc/create_workout_plan_bloc.dart';

import '../../../other/app_resource/AppStyle.dart';
import '../../common_loader/ui/common_loader_screen.dart';

class CreateWorkOutPlanScreen extends StatefulWidget {
  const CreateWorkOutPlanScreen({super.key});

  @override
  State<CreateWorkOutPlanScreen> createState() =>
      _CreateWorkOutPlanScreenState();
}

class _CreateWorkOutPlanScreenState extends State<CreateWorkOutPlanScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CreateWorkoutPlanBloc>().add(FetchBodyPartListEvent());
    context.read<CreateWorkoutPlanBloc>().add(FetchExerciseListEvent());
  }

  TextEditingController timeCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommonLoaderBloc, CommonLoaderState>(
      builder: (context, loaderState) {

        return BlocBuilder<CreateWorkoutPlanBloc, CreateWorkoutPlanState>(
  builder: (context, state) {
    return Stack(
      children: [
        Scaffold(
              body: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimen.mainScreenVerticalPadding,
                    horizontal: AppDimen.mainScreenHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          context.read<CreateWorkoutPlanBloc>().add(AddWorkoutPlanEvent());
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
                    SizedBox(height: 15,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Workout Duration",
                          style: AppStyles().greyRegularFontStyle(Colors.black),
                        ),

                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: DurationPicker(
                        duration: state.duration!,
                        onChange: (val) {
                          context.read<CreateWorkoutPlanBloc>().add(TimerDurationUpdateEvent(duration: val));
                        },
                      ),
                    ),
                    SizedBox(height: 15,),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Target Area",
                          style: AppStyles().greyRegularFontStyle(Colors.black),
                        ),
                DropdownButton(
                  isExpanded: true,


                  // Initial Value
                  value: state.selectedBodyItem,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: state.selectedBodyItemList?.data?.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    context.read<CreateWorkoutPlanBloc>().add(BodyItemDropdownEvent(selectedValue: newValue));
                  },
                ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Exercise Name",
                          style: AppStyles().greyRegularFontStyle(Colors.black),
                        ),
                        DropdownButton<ExerciseModel>(
                          isExpanded: true,


                          // Initial Value
                          value: state.selectedExerciseItem,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: state.selectedExerciseItemList?.data?.map((ExerciseModel items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items.exerciseName.toString()),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (ExerciseModel? newValue) {
                            context.read<CreateWorkoutPlanBloc>().add(ExerciseItemDropdownEvent(selectedValue: newValue));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Priority Level",
                          style: AppStyles().greyRegularFontStyle(Colors.black),
                        ),
                        DropdownButton<String>(
                          isExpanded: true,


                          // Initial Value
                          value: state.selectedPriority,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: state.priorityList?.data?.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            context.read<CreateWorkoutPlanBloc>().add(PriorityItemDropdownEvent(selectedValue: newValue!));
                          },
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
        if(loaderState is ShowLoaderState)  CommonLoader() else SizedBox.shrink()
      ],
    );
  },
);
      },
    );
  }
}
