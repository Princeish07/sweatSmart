import 'package:equatable/equatable.dart';

import '../../../data/model/LoginUserModel.dart';
import '../../../other/resource.dart';

class RegisterState extends Equatable{
  Resource<LoginUserModel>? registrationResponse;
  RegisterState({this.registrationResponse});

  @override
  List<Object?> get props => [registrationResponse];

  RegisterState copyWith({Resource<LoginUserModel>? registrationResponse}){
    return RegisterState(registrationResponse: registrationResponse ?? this.registrationResponse);
  }

}