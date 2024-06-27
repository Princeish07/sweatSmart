import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweat_smart/data/model/alarm_model.dart';
import 'package:sweat_smart/other/resource.dart';

class CreateAlarmRepository{
  CollectionReference alarm =   FirebaseFirestore.instance.collection("alarm");

  Future<Resource<bool>> createAlarm(AlarmModel alarmModel){
    DocumentReference<Object?> documentReference =   alarm.doc();
    documentReference.

  }
}