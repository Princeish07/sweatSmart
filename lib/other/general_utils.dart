import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toastification/toastification.dart';
import 'package:intl/intl.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

showToast(String message,BuildContext context){
  toastification.show(
    style: ToastificationStyle.fillColored,
    primaryColor: Colors.red.shade200,
    context: context, // optional if you use ToastificationWrapper
    title: Text(message),
    autoCloseDuration:  Duration(seconds: 2),
  );
}

formattedTime({required int timeInSecond}) {
  int sec = timeInSecond % 60;
  int min = (timeInSecond / 60).floor();
  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
  return "$minute : $second";
}

formattedToDateTime(DateTime? dateTime){
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yMMMd');
  final String formatted = formatter.format(now);
  return formatted;
}

formattedTimeAMPM(DateTime? dateTime,BuildContext context){


  var time =TimeOfDay(hour: dateTime!.hour,minute: dateTime!.minute).format(context);
  return time;

}

