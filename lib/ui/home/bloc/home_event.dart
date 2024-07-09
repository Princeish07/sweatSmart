import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable{

}

class GetLoggedInUserDetailEvent extends HomeEvent{



  @override
  List<Object?> get props => [];

}

class GetUserHealthDetails extends HomeEvent{



  @override
  List<Object?> get props => [];

}

class LogoutUser extends HomeEvent{



  @override
  List<Object?> get props => [];

}


class ResetStateEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
class FetchAlarmListEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ToggleAlarm extends HomeEvent {
  bool? isActive;
  DateTime? time;
  int? alarmId;


  ToggleAlarm({this.isActive,this.time,this.alarmId});
  @override
  List<Object?> get props => [isActive,time,alarmId];
}

class FetchExerciseList extends HomeEvent {
  @override
  List<Object?> get props => [];
}
