import '../../../data/model/foot_step.dart';
import '../../../other/resource.dart';

abstract class HomeRepository{
  Future<Resource<String?>> getUserDetailFromSharedPref();
  Future<Resource<List<FootSteps>>> getHealthDetails();

  Future<Resource<bool>> logoutUser();
}