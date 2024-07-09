import 'package:sweat_smart/data/model/ExerciseModel.dart';
import 'package:sweat_smart/other/resource.dart';
import 'package:sweat_smart/ui/running_excercise/repository/exercise_repository.dart';

import '../remote/ApiService.dart';

class ExerciseRepositoryImpl extends ExerciseRepository{


  @override
  Future<Resource<ExerciseModel>> fetchExerciseDetails(String? id) async {
    try {
      final response = await ApiService.instance.request(
          'exercises/exercise/$id',
          DioMethod.get,
          contentType: 'application/json',
          isAuthenticationRequired: true
      );
      if (response.statusCode == 200) {
        print('API call successful: ${response.data}');

        ExerciseModel exerciseModel = ExerciseModel.fromMap(response.data);


        return Resource.success(data: exerciseModel);
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