import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweat_smart/data/model/alarm_model.dart';
import 'package:sweat_smart/other/resource.dart';

abstract class AlarmRepository{

  Future<Resource<bool>> createAlarm({AlarmModel? alarmModel});



}