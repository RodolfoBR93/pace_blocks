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
      'workout_session_id': workoutSessionId,
      'workout_type_id': workoutType.id,
      'unit_type_id': unitType.id,
      'value': value,
    };
  }

  factory WorkoutItem.fromMap(Map<String, dynamic> map) {
    return WorkoutItem(
      id: map['id'],
      workoutSessionId: map['workout_session_id'],
      workoutType: WorkoutType.fromMap({
        'id': map['workout_type_id'],
        'name': '', // Será carregado separadamente se necessário
        'code': '',
        'locale_id': 0,
      }),
      unitType: UnitType.fromMap({
        'id': map['unit_type_id'],
        'name': '', // Será carregado separadamente se necessário
        'locale_id': 0,
      }),
      value: map['value'].toString(),
    );
  }
}
