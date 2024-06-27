part of 'create_alarm_bloc.dart';

abstract class CreateAlarmEvent extends Equatable {

}

class SetAlarmEvent extends CreateAlarmEvent{
  DateTime? dateTime;
  String? target;
  String? alarmName;
  String? sliderValue;

  SetAlarmEvent({ this.target, this.alarmName});
  @override
  List<Object?> get props => [dateTime,target,alarmName,sliderValue];

}

class SetDateTimeEvent extends CreateAlarmEvent{
DateTime? dateTime;

SetDateTimeEvent(this.dateTime);
@override
List<Object?> get props => [dateTime];

}

class SelectDayEvent extends CreateAlarmEvent{
  List<String>? selectedDays;

  SelectDayEvent(this.selectedDays);
  @override
  List<Object?> get props => [selectedDays];

}

class ChangeSlider extends CreateAlarmEvent{
  var sliderValue = 0.0;
  ChangeSlider(this.sliderValue);
  @override
  List<Object?> get props => [sliderValue];

}






