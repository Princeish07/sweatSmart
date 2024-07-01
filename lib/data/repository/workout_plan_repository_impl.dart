import 'package:sweat_smart/data/remote/ApiService.dart';
import 'package:sweat_smart/other/resource.dart';
import 'package:sweat_smart/ui/create_workout_plan/repository/workout_plan_repository.dart';

import '../model/BodyPartModel.dart';

class WorkoutPlanRepositoryImpl extends WorkoutPlanRepository{
  @override
  Future<Resource<List<String>>> getBodyPartList() async {
    try {
      final response = await ApiService.instance.request(
        'exercises/bodyPartList',
        DioMethod.get,
        contentType: 'application/json',
        isAuthenticationRequired: true
      );
      if (response.statusCode == 200) {

        print('API call successful: ${response.data}');
        var list = response.data as List<dynamic>;
        List<String> newList = [];
        for (var element in list) {
          newList.add(element.toString());
        }

        return Resource.success(data: newList);

      } else {
        print('API call failed: ${response.statusMessage}');
        return Resource.failure(message: response.statusMessage);

      }
    } catch (e) {
      return Resource.failure(message: e.toString());

      print('Network error occurred: $e');
    }
  }

  @override
  Future<void> getExerciseList() async {
    try {
      final response = await ApiService.instance.request(
          'exercises',
          DioMethod.get,
          contentType: 'application/json',
          isAuthenticationRequired: true
      );
      if (response.statusCode == 200) {
        print('API call successful: ${response.data}');
      } else {
        print('API call failed: ${response.statusMessage}');
      }
    } catch (e) {
      print('Network error occurred: $e');
    }
  }
}