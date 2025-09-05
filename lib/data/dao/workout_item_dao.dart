import 'package:pace_blocks/screens/create_workout/viewmodels/workout_item.dart';

import '../database/database_helper.dart';

class WorkoutItemDao {
  final dbHelper = DatabaseHelper();

  Future<void> insertWorkoutItem(WorkoutItem item) async {
    await dbHelper.insert('workout_items', item.toMap());
  }

  Future<void> insertWorkoutItems(List<WorkoutItem> items) async {
    final db = await dbHelper.database;
    await db.transaction((txn) async {
      for (final item in items) {
        await txn.insert('workout_items', item.toMap());
      }
    });
  }

  Future<List<WorkoutItem>> getAllWorkoutItems() async {
    final result = await dbHelper.query('workout_items', columns: null);
    return result.map((e) => WorkoutItem.fromMap(e)).toList();
  }

  Future<List<WorkoutItem>> getWorkoutItemsBySession(int sessionId) async {
    final db = await dbHelper.database;
    final result = await db.query(
      'workout_items',
      where: 'workout_session_id = ?',
      whereArgs: [sessionId],
    );
    return result.map((e) => WorkoutItem.fromMap(e)).toList();
  }

  Future<void> updateWorkoutItem(WorkoutItem item) async {
    await dbHelper.update('workout_items', item.toMap(), 'id = ?', [item.id]);
  }

  Future<void> deleteWorkoutItem(int id) async {
    await dbHelper.delete('workout_items', 'id = ?', [id]);
  }
}
