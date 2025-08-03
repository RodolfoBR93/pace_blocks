class WorkoutItem {
  final int? id;
  final int? workoutSessionId;
  final int? unitTypeId;
  final String value;
  final int? workoutTypeId;

  WorkoutItem({
    required this.id,
    required this.workoutSessionId,
    required this.unitTypeId,
    required this.value,
    required this.workoutTypeId,
  });

  Map<String, dynamic> toMap() {
    return{
      'id': id,
      'workoutSessionId': workoutSessionId,
      'unitTypeId': unitTypeId,
      'value': value,
      'workoutTypeId': workoutTypeId,
    };
  }

  factory WorkoutItem.fromMap(Map<String, dynamic> map){
    return WorkoutItem(
      id: map['id'],
      workoutSessionId: map['workoutSessionId'],
      unitTypeId: map['unitTypeId'],
      value: map['value'],
      workoutTypeId: map['workoutTypeId'],
    );
  }
}
