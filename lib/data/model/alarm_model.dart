

import 'package:cloud_firestore/cloud_firestore.dart';

class AlarmModel{
  String? id;
  String? uid;
  String? alarmId;


  DateTime? time;

  String? alarmName;
  String? target;
  String? volume;

  AlarmModel({this.id,this.uid,this.time,this.alarmName,this.target,this.volume,this.alarmId});

  Map<String, dynamic> toMap() {
    return {
      'alarmId':alarmId,
      'id': id,
      'uid': uid,
      'time': time,
      'alarmName': alarmName,
      'target': target,
      'volume': volume,

    };
  }

  AlarmModel.fromMap(Map<String, dynamic> addressMap)
      :        alarmId = addressMap["alarmId"],

      id = addressMap["id"],
        uid = addressMap["uid"],
      time = (addressMap["time"] as Timestamp).toDate(),
        alarmName = addressMap["alarmName"],
        target = addressMap["target"],

        volume = addressMap["volume"];




}