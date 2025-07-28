import 'package:pace_blocks/screens/create_workout/viewmodels/workout_type.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    _database ??= await _initDB('workouts.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE workout_types (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        code TEXT NOT NULL,
        locale TEXT NOT NULL 
      )
    ''');

    await db.insert('workout_types', {
      'name': 'Caminhada',
      'code': 'CA',
      'locale': 'pt-br',
    });
    await db.insert('workout_types', {
      'name': 'Trote',
      'code': 'TR',
      'locale': 'pt-br',
    });
    await db.insert('workout_types', {
      'name': 'Corrida Leve',
      'code': 'CL',
      'locale': 'pt-br',
    });
    await db.insert('workout_types', {
      'name': 'Corrida Moderada',
      'code': 'CM',
      'locale': 'pt-br',
    });
    await db.insert('workout_types', {
      'name': 'Corrida Forte',
      'code': 'CF',
      'locale': 'pt-br',
    });
    await db.insert('workout_types', {
      'name': 'Corrida Muito Forte',
      'code': 'CMF',
      'locale': 'pt-br',
    });
    await db.insert('workout_types', {
      'name': 'Vo2 Max',
      'code': 'VO2',
      'locale': 'pt-br',
    });
    await db.insert('workout_types', {
      'name': 'Descanso',
      'code': 'DE',
      'locale': 'pt-br',
    });
    await db.insert('workout_types', {
      'name': 'Treino Alongamento',
      'code': 'TA',
      'locale': 'pt-br',
    });
  }

  Future<List<WorkoutType>> getAllWorkoutTypes() async {
    final db = await instance.database;
    final result = await db.query('workout_types');
    return result.map((map) => WorkoutType.fromMap(map)).toList();
  }

  Future<void> insertWorkoutType(WorkoutType workoutType) async {
    final db = await instance.database;
    await db.insert('workout_types', workoutType.toMap());
  }
}
