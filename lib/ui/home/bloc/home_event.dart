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
