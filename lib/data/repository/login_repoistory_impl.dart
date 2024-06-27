import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweat_smart/data/model/LoginUserModel.dart';
import 'package:sweat_smart/other/resource.dart';
import 'package:sweat_smart/ui/login/repository/auth_repository.dart';

class LoginRepositoryImpl extends AuthRepository{
  @override
  Future<Resource<LoginUserModel>> loginWithEmail(String email, String password) async {

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      LoginUserModel user = LoginUserModel(email: credential.user?.email,userName: password,id: credential.user?.uid.toString());

      return Resource.success(data: user);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return Resource.failure(message: 'No user found for that email.');

      } else if (e.code == 'wrong-password') {
        return Resource.failure(message: 'Wrong password provided for that user');

      }else{
        return Resource.failure(message: e.message.toString());

      }
    }
  }

}