part of 'create_alarm_bloc.dart';



 class CreateAlarmState extends Equatable {

  double? sliderValue=0.0;
  DateTime? dateTime;
  Resource<String>? response;

  List<bool>? selectedWeekdays = List.filled(7, false);
  CreateAlarmState({this.sliderValue,this.selectedWeekdays,this.dateTime,this.response});

  CreateAlarmState copyWith({double? sliderValue, List<bool>? selectedWeekday,DateTime? dateTime,List<bool>? selectedWeekdays,Resource<String>? response}){
   return CreateAlarmState(sliderValue: sliderValue ?? this.sliderValue,selectedWeekdays: selectedWeekday ?? this.selectedWeekdays,dateTime: dateTime ?? this.dateTime,response: response ?? this.response);
  }

  @override
  List<Object?> get props => [sliderValue,selectedWeekdays,dateTime,response];

}
