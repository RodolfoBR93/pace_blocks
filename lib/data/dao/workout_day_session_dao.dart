import '../database/database_helper.dart';

class WorkoutDaySessionDao {
  final dbHelper = DatabaseHelper();

  Future<int> insertWorkoutDaySession(
    String name,
    int dayId,
    int workoutSessionsId,
  ) async {
    return await dbHelper.insert('workout_day_session', {
      'name': name,
      'day_id': dayId,
      'workout_sessions_id': workoutSessionsId,
    });
  }

  Future<List<Map<String, dynamic>>> getAllWorkoutDaySessions() async {
    return await dbHelper.query('workout_day_session', columns: null);
  }

  Future<void> updateWorkoutDaySession(
    int id,
    String name,
    int dayId,
    int workoutSessionsId,
  ) async {
    await dbHelper.update(
      'workout_day_session',
      {'name': name, 'day_id': dayId, 'workout_sessions_id': workoutSessionsId},
      'id = ?',
      [id],
    );
  }

  Future<void> deleteWorkoutDaySession(int id) async {
    await dbHelper.delete('workout_day_session', 'id = ?', [id]);
  }
}
