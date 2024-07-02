class ExerciseModel{
  String? bodyPartName;
  String? exerciseName;
  List<String>? instruction;
  String? equipment;
  String? gif;
  String? target;
  List<String>? secondaryMuscles;
  String? id;
  ExerciseModel({this.bodyPartName,this.exerciseName,this.instruction,this.equipment,this.gif,this.target,this.secondaryMuscles,this.id});
  Map<String, dynamic> toMap() {
    return {
      'bodyPart':bodyPartName,
      'id': id,
      'name': exerciseName,
      'instructions': instruction,
      'equipment': equipment,
      'target': target,
      'gifUrl': gif,
      'secondaryMuscles': secondaryMuscles,

    };
  }

  ExerciseModel.fromMap(Map<String, dynamic> addressMap)
      :        bodyPartName = addressMap["bodyPart"],

        id = addressMap["id"],
        exerciseName = addressMap["name"],
        instruction = List<String>.from(addressMap["instructions"] ?? []),
        equipment = addressMap["equipment"],
        target = addressMap["target"],

        gif = addressMap["gifUrl"],
  secondaryMuscles = List<String>.from(addressMap["secondaryMuscles"] ?? []);



  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ExerciseModel &&
              runtimeType == other.runtimeType &&
              exerciseName == other.exerciseName;

  @override
  int get hashCode => exerciseName.hashCode;
}