import 'package:equatable/equatable.dart';

class LoginUserModel extends Equatable {
  const LoginUserModel({
     this.id = "",
     this.userName="",
     this.email="",
     this.gender="",
     this.phoneNumber=""

  });

  final String? email;
  final String? userName;
  final String? phoneNumber;
  final String? id;
  final String? gender;


  LoginUserModel copyWith(
      {String? email, String? userName, String? phoneNumber, String? id,String? gender }) {
    return LoginUserModel(id: id ?? this.id,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        phoneNumber: phoneNumber ?? this.phoneNumber);
  }

  @override
  List<Object?> get props => [email, userName, phoneNumber, id, gender];

}