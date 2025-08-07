import 'package:pace_blocks/screens/create_workout/viewmodels/unit_type.dart';
import 'package:pace_blocks/screens/create_workout/viewmodels/workout_type.dart';

class WorkoutItem {
  final int? id;
  final int? workoutSessionId;
  final WorkoutType workoutType;
  final UnitType unitType;
  final String value;

  WorkoutItem({
    required this.id,
    required this.workoutSessionId,
    required this.workoutType,
    required this.unitType,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'workoutSessionId': workoutSessionId,
      'workoutType': workoutType,
      'unitType': unitType,
      'value': value,
    };
  }

  factory WorkoutItem.fromMap(Map<String, dynamic> map) {
    return WorkoutItem(
      id: map['id'],
      workoutSessionId: map['workoutSessionId'],
      workoutType: map['workoutType'],
      unitType: map['unitType'],
      value: map['value'],
    );
  }
}
