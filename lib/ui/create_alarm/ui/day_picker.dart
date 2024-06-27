import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';
class DayPicker extends StatefulWidget {
  Function(List<String>?) selectedDays;
   DayPicker({super.key,required this.selectedDays});

  @override
  State<DayPicker> createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker> {

  final List<DayInWeek> _days = [
    DayInWeek(
      "Sun",
      dayKey: 'Sun',
    ),
    DayInWeek(
      "Mon",
      dayKey: 'Mon',
    ),
    DayInWeek(
        "Tue",
        isSelected: true, dayKey: 'Tue',
    ),
    DayInWeek(
      "Wed",
       dayKey: 'Wed',
    ),
    DayInWeek(
      "Thu",
      dayKey: 'Thu',
    ),
    DayInWeek(
      "Fri",
      dayKey: 'Fri',
    ),
    DayInWeek(
      "Sat",
      dayKey: 'Sat',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SelectWeekDays(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          days: _days,
          border: false,
          boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              colors: [Color(0xFFE55CE4), Color(0xFFBB75FB)],
              tileMode:
              TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          onSelect: (values) { // <== Callback to handle the selected days
            print(values);
            widget.selectedDays(values);
          },
        ),
      ),
    );
  }
}
