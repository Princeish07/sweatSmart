import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable{
  const RegisterEvent();
  @override
  List<Object?> get props => [];


}

class RegisterButtonClickEvent extends RegisterEvent{
  RegisterButtonClickEvent({required this.email,required this.userName,required this.phone,required this.password,required this.confirmPassword});

  String? phone;
  String? userName;
  String? email;
  String? password;
  String? confirmPassword;

  @override
  List<Object?> get props => [phone,userName,email,password,confirmPassword];


}