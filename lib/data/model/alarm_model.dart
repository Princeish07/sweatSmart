

class AlarmModel{
  String? id;
  DateTime? time;
  String? alarmName;
  String? target;
  String? volume;

  AlarmModel({this.id,this.time,this.alarmName,this.target,this.volume});

  Map<String, dynamic> toMap() {
    return {
      'id': id,

      'time': time,
      'alarmName': alarmName,
      'target': target,
      'volume': volume,

    };
  }

  AlarmModel.fromMap(Map<String, dynamic> addressMap)
      :
        id = addressMap["id"],

      time = addressMap["time"],
        alarmName = addressMap["alarmName"],
        target = addressMap["target"],

        volume = addressMap["volume"];

}