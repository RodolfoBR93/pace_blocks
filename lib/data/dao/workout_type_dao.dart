import 'package:pace_blocks/screens/create_workout/viewmodels/workout_type.dart';
import '../database/database_helper.dart';

class WorkoutTypeDao {
  final dbHelper = DatabaseHelper();

  Future<void> insertWorkoutType(WorkoutType type) async {
    await dbHelper.insert('workout_types', type.toMap());
  }

  Future<List<WorkoutType>> getAllWorkoutTypes() async {
    final result = await dbHelper.query('workout_types', [
      'id',
      'name',
      'code',
      'locale_id',
    ]);
    final map = result.map((e) => WorkoutType.fromMap(e)).toList();
    return map;
  }

  Future<void> updateWorkoutType(WorkoutType type) async {
    await dbHelper.update('workout_types', type.toMap(), 'id = ?', [type.id]);
  }

  Future<void> deleteWorkoutType(int id) async {
    await dbHelper.delete('workout_types', 'id = ?', [id]);
  }
}
