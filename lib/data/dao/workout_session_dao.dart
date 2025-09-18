import '../database/database_helper.dart';

class WorkoutSessionDao {
  final dbHelper = DatabaseHelper();

  Future<int> insertWorkoutSession(int repetitions) async {
    return await dbHelper.insert('workout_sessions', {
      'repetitions': repetitions,
    });
  }

  Future<List<Map<String, dynamic>>> getAllWorkoutSessions() async {
    return await dbHelper.query('workout_sessions', columns: null);
  }

  Future<void> updateWorkoutSession(int id, int repetitions) async {
    await dbHelper.update(
      'workout_sessions',
      {'repetitions': repetitions},
      'id = ?',
      [id],
    );
  }

  Future<void> deleteWorkoutSession(int id) async {
    await dbHelper.delete('workout_sessions', 'id = ?', [id]);
  }
}
