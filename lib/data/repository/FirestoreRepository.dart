import 'package:cloud_firestore/cloud_firestore.dart';

import '../../other/resource.dart';
import '../model/LoginUserModel.dart';

class FirebaseRepository {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<Resource<LoginUserModel>> addUser(
      {LoginUserModel? loginUserModel,
      String? password,
      String? confirmPassword}) async {
    try {
      Resource<LoginUserModel> resource = Resource.loading();
      await users.doc(loginUserModel?.id).set(loginUserModel?.toMap()).then((value) {
        resource = Resource.success(data: loginUserModel);
      }, onError: (e) {
        resource = Resource.failure(
            message: "Data not saved : Error ${e.toString()}");
      });
      return resource;
    } catch (e) {
      return Resource.failure(message: e.toString());
    }
  }
}
