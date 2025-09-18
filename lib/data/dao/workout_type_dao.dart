import 'package:pace_blocks/screens/create_workout/viewmodels/workout_type.dart';
import '../database/database_helper.dart';
import 'dart:io';

class WorkoutTypeDao {
  final dbHelper = DatabaseHelper();

  Future<void> insertWorkoutType(WorkoutType type) async {
    await dbHelper.insert('workout_types', type.toMap());
  }

  Future<List<WorkoutType>> getWorkoutTypes() async {
    try {
      final deviceLocale = Platform.localeName.split('_')[0];

      final db = await dbHelper.database;
      final result = await db.rawQuery(
        '''
        SELECT wt.id, wt.name, wt.code, wt.locale_id
        FROM workout_types wt
          INNER JOIN locales l ON wt.locale_id = l.id
        WHERE l.code = ?
      ''',
        [deviceLocale],
      );

      final map = result.map((e) => WorkoutType.fromMap(e)).toList();
      return map;
    } catch (e) {
      return await _getFallbackWorkoutTypes();
    }
  }

  Future<List<WorkoutType>> _getFallbackWorkoutTypes() async {
    try {
      final db = await dbHelper.database;
      final result = await db.rawQuery('''
        SELECT wt.id, wt.name, wt.code, wt.locale_id
        FROM workout_types wt
          INNER JOIN locales l ON wt.locale_id = l.id
        WHERE l.code = 'en'
      ''');

      return result.map((e) => WorkoutType.fromMap(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> updateWorkoutType(WorkoutType type) async {
    await dbHelper.update('workout_types', type.toMap(), 'id = ?', [type.id]);
  }

  Future<void> deleteWorkoutType(int id) async {
    await dbHelper.delete('workout_types', 'id = ?', [id]);
  }
}
