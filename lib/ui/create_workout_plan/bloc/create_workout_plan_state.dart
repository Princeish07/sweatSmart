part of 'create_workout_plan_bloc.dart';

class CreateWorkoutPlanState extends Equatable {
  String? selectedBodyItem = 'Select';
  Resource<bool>? createWorkoutPlanResponse;
  Duration? duration = Duration(hours: 0, minutes: 0);

  // List of items in our dropdown menu
  Resource<List<String>>? selectedBodyItemList = Resource.loading(data: [
    'Select',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ]);

  String? selectedPriority = 'Select';

  // List of items in our dropdown menu
  Resource<List<String>>? priorityList = Resource.loading(data: [
    'Select',
    'High',
    'Medium',
    'Low',
  ]);

  ExerciseModel? selectedExerciseItem = ExerciseModel(exerciseName: "Select");

  // List of items in our dropdown menu
  Resource<List<ExerciseModel>>? selectedExerciseItemList =
      Resource.loading(data: [ExerciseModel(exerciseName: "Select")]);

  CreateWorkoutPlanState(
      {this.selectedBodyItem = 'Select',
      Resource<List<String>>? selectedBodyItemList,
      ExerciseModel? selectedExerciseItem,
      Resource<List<ExerciseModel>>? selectedExerciseItemList,
      Resource<List<String>>? priorityList,
        this.createWorkoutPlanResponse,
      this.selectedPriority = "Select",
      this.duration = const Duration(hours: 0, minutes: 0),})
      : selectedBodyItemList = selectedBodyItemList ??
            Resource.success(
                data: const ['Select', 'Item 2', 'Item 3', 'Item 4', 'Item 5']),
        selectedExerciseItem =
            selectedExerciseItem ?? ExerciseModel(exerciseName: "Select"),
        selectedExerciseItemList = selectedExerciseItemList ??
            Resource.success(data: [
              ExerciseModel(exerciseName: "Select"),
              ExerciseModel(exerciseName: "Select 1 ")
            ]),
        priorityList = priorityList ??
            Resource.success(data: const [
              'Select',
              'High',
              'Medium',
              'Low',
            ]);

  CreateWorkoutPlanState copyWith(
      {String? selectedBodyItem,
      Resource<List<String>>? selectedBodyItemList,
      ExerciseModel? selectedExerciseItem,
      Resource<List<ExerciseModel>>? selectedExerciseItemList,
      String? selectedPriority,
      Resource<List<String>>? priorityList,
      Duration? duration,
        Resource<bool>? createWorkoutPlanResponse}) {
    return CreateWorkoutPlanState(
        selectedBodyItem: selectedBodyItem ?? this.selectedBodyItem,
        selectedBodyItemList: selectedBodyItemList ?? this.selectedBodyItemList,
        selectedExerciseItem: selectedExerciseItem ?? this.selectedExerciseItem,
        selectedExerciseItemList:
            selectedExerciseItemList ?? this.selectedExerciseItemList,
        selectedPriority: selectedPriority ?? this.selectedPriority,
        priorityList: priorityList ?? this.priorityList,
        duration: duration ?? this.duration,createWorkoutPlanResponse: createWorkoutPlanResponse ??  this.createWorkoutPlanResponse);
  }

  @override
  List<Object?> get props => [
        selectedBodyItem,
        selectedBodyItemList,
        selectedExerciseItem,
        selectedExerciseItemList,
        selectedPriority,
        priorityList,
        duration,
    createWorkoutPlanResponse
      ];
}
//
// class CreateWorkoutInitialPlanState extends CreateWorkoutPlanState {
//   @override
//   List<Object?> get props => [];
// }
//
// class GetBodyPartListState extends CreateWorkoutPlanState{
//   String? selectedBodyItem = 'Item 1';
//
//   // List of items in our dropdown menu
//   List<String>? selectedBodyItemList = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];
//   GetBodyPartListState({this.selectedBodyItem,this.selectedBodyItemList});
//
//   GetBodyPartListState copyWith({String? selectedBodyItem,List<String>? selectedBodyItemList}){
//     return GetBodyPartListState(selectedBodyItem: selectedBodyItem ?? this.selectedBodyItem,selectedBodyItemList: selectedBodyItemList ?? this.selectedBodyItemList);
//   }
//   @override
//   List<Object?> get props => [selectedBodyItem,selectedBodyItemList];
//
// }
//
//
// class GetExerciseListState extends CreateWorkoutPlanState{
//   @override
//   List<Object?> get props => [];
//
// }
