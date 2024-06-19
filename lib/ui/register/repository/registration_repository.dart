import 'package:sweat_smart/data/model/LoginUserModel.dart';

import '../../../other/resource.dart';

abstract class  RegistrationRepository{
  Future<Resource<LoginUserModel>> registrationNow(
      {String? email,
      String? userName,
      String? phone,
      String? password,
      String? confirmPassword});
}