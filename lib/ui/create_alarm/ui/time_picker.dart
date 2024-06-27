import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../../../other/app_resource/AppColors.dart';

class WheelPickerExample extends StatefulWidget {
  Function(DateTime)? onTimeChange;
   WheelPickerExample({super.key,this.onTimeChange, });

  @override
  State<WheelPickerExample> createState() => _WheelPickerExampleState();
}

class _WheelPickerExampleState extends State<WheelPickerExample> {
  DateTime? _dateTime;
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 32.0, height: 1.5);


    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: const TextStyle(
          fontSize: 20,
          color: Color(AppColors.grayText)
      ),
      highlightedTextStyle: const TextStyle(
          fontSize: 30,
          color: Color(AppColors.lightPink),
      ),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      onTimeChange: widget.onTimeChange,
    );
  }
}

