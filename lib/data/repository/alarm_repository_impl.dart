import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweat_smart/data/model/alarm_model.dart';

import 'package:sweat_smart/other/resource.dart';

import '../../ui/create_alarm/repository/create_alarm_repository.dart';

class AlarmRepositoryImpl extends AlarmRepository{
  CollectionReference alarm =   FirebaseFirestore.instance.collection("users");

  @override
  Future<Resource<bool>> createAlarm({AlarmModel? alarmModel}) async {
    try {
      DocumentReference<Object?> documentReference =   alarm.doc(FirebaseAuth.instance.currentUser?.uid);


      DocumentReference<Object?> myAlarmDocRef =  documentReference.collection('my_alarm').doc();
      alarmModel?.id = myAlarmDocRef.id;
      alarmModel?.uid = FirebaseAuth.instance.currentUser?.uid;
      await myAlarmDocRef.set(alarmModel?.toMap());

      return Resource.success(data: true);

    } catch (e) {
      print("Create Alarm:-> ${e.toString()}");
      return Resource.failure(message: e.toString());

    }
  }

}