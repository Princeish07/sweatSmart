import '../../../data/model/LoginUserModel.dart';
import '../../../other/resource.dart';

abstract class LoginRepository{
  Future<Resource<LoginUserModel>> loginWithEmail(String email, String password);
}