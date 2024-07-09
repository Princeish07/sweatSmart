import 'package:sweat_smart/data/model/ExerciseModel.dart';

import '../../../data/model/alarm_model.dart';
import '../../../other/resource.dart';

abstract class ExerciseRepository{
  Future<Resource<ExerciseModel>> fetchExerciseDetails(String? id);

}