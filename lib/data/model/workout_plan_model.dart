import 'package:sweat_smart/data/model/ExerciseModel.dart';

class WorkoutPlanModel {
  String? id;
  String? uid;

  ExerciseModel? exercise;
  String? priority;
  String? bodyPart;
  Duration? duration;

  WorkoutPlanModel(
      {this.exercise, this.priority, this.bodyPart, this.duration,this.id,this.uid});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,

      'exercise': exercise?.toMap(),
      'priority': priority,
      'bodyPart': bodyPart,
      'durationInMinutes': duration!.inMinutes,
      'durationInSecond':duration!.inSeconds
    };
  }

  WorkoutPlanModel.fromMap(Map<String, dynamic> addressMap)
      : exercise = ExerciseModel.fromMap(addressMap["exercise"]),
        id = addressMap["id"],
        uid = addressMap["uid"],

      priority = addressMap["priority"],
        bodyPart = addressMap["bodyPart"],
        duration = Duration(minutes: addressMap["durationInMinutes"],seconds: addressMap["durationInSecond"]);


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ExerciseModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}
