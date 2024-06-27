import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweat_smart/data/model/LoginUserModel.dart';
import 'package:sweat_smart/other/resource.dart';
import 'package:sweat_smart/ui/register/repository/registration_repository.dart';

class RegistrationRepositoryImpl extends RegistrationRepository {
  @override
  Future<Resource<LoginUserModel>> registrationNow(
      {String? email,
      String? userName,
      String? phone,
      String? password,
      String? confirmPassword}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email ?? "",
        password: password ?? "",
      );

      LoginUserModel loginUserModel = LoginUserModel(
        id: credential.user?.uid,
          email: credential.user?.email,
          userName: userName,
          phoneNumber: phone);
      return Resource.success(data: loginUserModel);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return Resource.failure(message: "weak-password");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return Resource.failure(
            message: "The account already exists for that email.");
      } else {
        return Resource.failure(message: e.toString());
      }
    } catch (e) {
      print(e);
      return Resource.failure(message: e.toString());
    }
  }


}
