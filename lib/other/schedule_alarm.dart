import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class AlarmService {
  Future<void> setRepeatingAlarm(
      {required int hour,
      required int minute,
      required List<int> weekdays,required String message, required String target}) async {
    // Save alarm details in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('alarm_hour', hour);
    prefs.setInt('alarm_minute', minute);
    prefs.setStringList('alarm_weekdays', weekdays.map((e) => e.toString()).toList());

    for (int i = 0; i < weekdays.length; i++) {
      int day = weekdays[i];
      await AndroidAlarmManager.periodic(
        const Duration(days: 7),
        day,
          (){
            alarmCallback(title: target,message: message);
          },
        startAt: _nextInstanceOfTime(hour, minute, day),
        exact: true,
        wakeup: true,allowWhileIdle: true
      );
    }
  }

  DateTime _nextInstanceOfTime(int hour, int minute, int day) {
    DateTime now = DateTime.now();
    DateTime nextInstance = DateTime(now.year, now.month, now.day, hour, minute);
    while (nextInstance.weekday != day || nextInstance.isBefore(now)) {
      nextInstance = nextInstance.add(const Duration(days: 1));
    }
    return nextInstance;
  }
}

void alarmCallback({String? title, String? message}) {
  print('Alarm Fired!');
  showNotification(title: title,message: message);
}


Future<void> showNotification({String? title, String? message}) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    'alarm_channel',
    'Alarm Notifications',
    playSound: true,
    channelDescription: 'Channel for alarm notifications',
    sound: RawResourceAndroidNotificationSound('song1'),
    importance: Importance.max,
    priority: Priority.high,
  );
  const NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    message,
    platformChannelSpecifics,
    payload: 'Alarm Payload',
  );
}