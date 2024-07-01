import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';
import 'package:sweat_smart/data/model/alarm_model.dart';
import 'package:sweat_smart/other/resource.dart';

import '../../../other/schedule_alarm.dart';
import '../repository/create_alarm_repository.dart';

part 'create_alarm_event.dart';
part 'create_alarm_state.dart';

class CreateAlarmBloc extends Bloc<CreateAlarmEvent, CreateAlarmState> {
Resource<String>? response;
List<bool>? selectedWeekdays = List.filled(7, false);
AlarmRepository? alarmRepository;

  CreateAlarmBloc({this.alarmRepository}) : super(CreateAlarmState()) {
    on<SetAlarmEvent>(_setAlarm);
    on<ChangeSlider>(_changeSlider);
    on<SetDateTimeEvent>(_setDateAndTimeEvent);
    on<SelectDayEvent>(_selectDayEvent);


  }





  static const List<String> _weekdays = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
  ];

  Future<void> _setAlarm(SetAlarmEvent event, Emitter<CreateAlarmState> emitter) async {
    // print(state.dateTime);
    // print(state.selectedDay);
    // print(state.sliderValue);
    // print(event.alarmName);
    // print(event.target);
    // emitter(state.copyWith(response: Resource.loading()));
    //
    // List<int> selectedWeekdays1 = [];
    // for (int i = 0; i < selectedWeekdays!.length; i++) {
    //   if (selectedWeekdays![i]) {
    //     selectedWeekdays1.add(i + 1); // Weekday in Dart starts from 1 (Monday)
    //   }
    // }
    // print(selectedWeekdays1);
    // AlarmService().setRepeatingAlarm(
    //   hour: state.dateTime!.hour,
    //   minute: state.dateTime!.minute,
    //   weekdays: selectedWeekdays1, message: event.alarmName ?? "NA", target: event.target ?? "NA",
    // );

    try {
      var alarmId = state.dateTime.hashCode;
      final alarmSettings = AlarmSettings(
            id: alarmId,
            dateTime: state.dateTime!,
            assetAudioPath: 'assets/alarm.mp3',
            loopAudio: true,
            vibrate: true,
            volume: state.sliderValue,
            fadeDuration: 3.0,
            notificationTitle: event.target!,
            notificationBody: event.alarmName!,
            enableNotificationOnKill: false

          );
      Alarm.set(alarmSettings: alarmSettings);


      await alarmRepository?.createAlarm(alarmModel: AlarmModel(time: state.dateTime,alarmName: event.alarmName,target: event.target,volume: state.sliderValue.toString(),alarmId: alarmId.toString()));
      print("Success");
      emitter(state.copyWith(response: Resource.success()));

    } catch (e) {
      print(e);
      emitter(state.copyWith(response: Resource.failure(message: e.toString())));

    }



  }

  void _changeSlider(ChangeSlider event, Emitter<CreateAlarmState> emitter){
    emitter(state.copyWith(sliderValue:event.sliderValue));

  }
  void _setDateAndTimeEvent(SetDateTimeEvent event, Emitter<CreateAlarmState> emitter){
    emitter(state.copyWith(dateTime:event.dateTime));

  }
  void _selectDayEvent(SelectDayEvent event, Emitter<CreateAlarmState> emitter){
    for (final selectedDay in event.selectedDays!) {
      final int? index = dayNameToIndexMap[selectedDay]; // Lowercase for case-insensitivity
      if (index != null) {
        selectedWeekdays?[index] = true;
      } else {
        print('Warning: Invalid day name: $selectedDay');
      }
    }

    emitter(state.copyWith(selectedWeekdays:selectedWeekdays));

  }
final dayNameToIndexMap = {
  'Sun': 0,
  'Mon': 1,
  'Tue': 2,
  'Wed': 3,
  'Thu': 4,
  'Fri': 5,
  'Sat': 6,
};
}
