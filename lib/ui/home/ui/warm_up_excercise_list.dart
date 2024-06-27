import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:sweat_smart/other/AppContants.dart';
import 'package:sweat_smart/other/app_resource/AppColors.dart';

import '../../../data/model/warm_up_excercise_model.dart';
import '../../../other/app_resource/AppDimen.dart';
import '../../../other/app_resource/AppStyle.dart';
import '../../running_excercise/ui/running_excercise_screen.dart';

class WarmUpExcerciseList extends StatefulWidget {
  const WarmUpExcerciseList({super.key});

  @override
  State<WarmUpExcerciseList> createState() => _WarmUpExcerciseListState();
}

class _WarmUpExcerciseListState extends State<WarmUpExcerciseList> {
  List<WarmUpExcerciseModel> list = [
    WarmUpExcerciseModel(
        excerciseName: "Skipping",
        excerciseTime: "30",
        excerciseImage: AppConstants.icSkipping,
        exerciseGif:
            "https://firebasestorage.googleapis.com/v0/b/sweatsmart-f8f05.appspot.com/o/gif%2Fgiphy.gif?alt=media&token=9c429089-fe81-4a1d-9e8a-51e5bdd4d1c4"),
    WarmUpExcerciseModel(
        excerciseName: "Meditation",
        excerciseTime: "15",
        excerciseImage: AppConstants.icMeditation,
    exerciseGif: "https://firebasestorage.googleapis.com/v0/b/sweatsmart-f8f05.appspot.com/o/gif%2Fmeditation.gif?alt=media&token=eab6767f-5b73-4166-af4a-354a82cbe9da"),
    WarmUpExcerciseModel(
        excerciseName: "Exercise",
        excerciseTime: "35",
        excerciseImage: AppConstants.icExcercise,exerciseGif: "https://firebasestorage.googleapis.com/v0/b/sweatsmart-f8f05.appspot.com/o/gif%2Fexcercise.gif?alt=media&token=809580c5-d0eb-4bb5-b1e7-7859dd1874ca"),
    WarmUpExcerciseModel(
        excerciseName: "Running",
        excerciseTime: "25",
        excerciseImage: AppConstants.icTrademill,
    exerciseGif: "https://firebasestorage.googleapis.com/v0/b/sweatsmart-f8f05.appspot.com/o/gif%2Ftradmill.gif?alt=media&token=392fc377-a853-426c-9879-e18f35137cb3"),
    WarmUpExcerciseModel(
        excerciseName: "Yoga",
        excerciseTime: "15",
        excerciseImage: AppConstants.icYoga,
  exerciseGif: "https://firebasestorage.googleapis.com/v0/b/sweatsmart-f8f05.appspot.com/o/gif%2Fyoga.gif?alt=media&token=cf5a80d7-c755-43be-a72d-628ea77a3e7a")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(left: AppDimen.mainScreenHorizontalPadding),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RunningExcerciseScreen(
                                millisecond:
                                    StopWatchTimer.getMilliSecFromMinute(
                                        int.parse(
                                            list[index].excerciseTime ?? "0")),
                            gif: list[index].exerciseGif,
                              )));
                },
                child: ExcerciseListItem(
                    value: list[index].excerciseTime ?? "",
                    name: list[index].excerciseName ?? "",
                    icon: list[index].excerciseImage ?? ""));
          }),
    );
  }
}

class ExcerciseListItem extends StatefulWidget {
  final String value;
  final String name;
  final String icon;

  const ExcerciseListItem(
      {super.key, required this.value, required this.name, required this.icon});

  @override
  State<ExcerciseListItem> createState() => _ExcerciseListItemState();
}

class _ExcerciseListItemState extends State<ExcerciseListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 100,
      margin:
          EdgeInsets.only(right: AppDimen.mainScreenHorizontalPadding, top: 15),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Color(AppColors.grayBorder))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.network(
            widget.icon,
            placeholderBuilder: (context) {
              return Icon(Icons.sports_gymnastics);
            },
          ),
          Text(widget.value, style: AppStyles().regularFontStyle(Colors.black)),
          Text(widget.name, style: AppStyles().greySmallFontStyle(Colors.black))
        ],
      ),
    );
  }
}
