import 'package:equatable/equatable.dart';

abstract class LoginEvent  extends Equatable{


}

class LoggedInEvent extends LoginEvent{
  String? email;
  String? password;
  LoggedInEvent({required this.email,required this.password});

  @override
  List<Object?> get props => [email,password];
}

