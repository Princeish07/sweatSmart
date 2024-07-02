import 'dart:convert';

import 'package:sweat_smart/data/remote/ApiService.dart';
import 'package:sweat_smart/other/resource.dart';
import 'package:sweat_smart/ui/create_workout_plan/repository/workout_plan_repository.dart';

import '../model/ExerciseModel.dart';

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
        List<String> newList = ["Select"];
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
  Future<Resource<List<ExerciseModel>>> getExerciseList({String? bodyPart}) async {
    try {
      final response = await ApiService.instance.request(
          'exercises/bodyPart/$bodyPart',
          DioMethod.get,
          contentType: 'application/json',
          isAuthenticationRequired: true
      );
      if (response.statusCode == 200) {
        print('API call successful: ${response.data}');

        List<dynamic> list = response.data;
        List<ExerciseModel> modelList = [ExerciseModel(exerciseName: "Select")];
        modelList.addAll(list.map((e) => ExerciseModel.fromMap(e)).toList());


        return Resource.success(data: modelList);
      } else {
        print('API call failed: ${response.statusMessage}');
        return Resource.failure(message: response.statusMessage);

      }
    } catch (e) {
      print('Network error occurred: $e');
      return Resource.failure(message: e.toString());

    }
  }
}