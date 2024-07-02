import 'package:sweat_smart/data/model/ExerciseModel.dart';

class WorkoutPlanModel{
  ExerciseModel? exercise;
  String? priority;
  String? bodyPart;
  Duration? duration;

  WorkoutPlanModel({this.exercise,this.priority,this.bodyPart,this.duration});

  Map<String, dynamic> toMap() {
    return {
      'exercise':exercise,
      'priority': priority,
      'bodyPart': bodyPart,
      'duration': duration

    };
  }

  WorkoutPlanModel.fromMap(Map<String, dynamic> addressMap)
      :        exercise = addressMap["exercise"],

        priority = addressMap["priority"],
        bodyPart = addressMap["bodyPart"],
        duration = addressMap["duration"];
}