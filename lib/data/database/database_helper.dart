
import 'dart:io';
import 'package:pace_blocks/screens/create_workout/viewmodels/workout_type.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('workouts.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate
    );
  }

  Future _onCreate(Database db, int version) async {
	//create workout_types table
    await db.execute('''
      CREATE TABLE workout_types (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        code TEXT NOT NULL,
        locale TEXT NOT NULL
      )
    ''');

    //create workout_sessions table
    await db.execute('''
      CREATE TABLE workout_sessions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        repetitions INTEGER NOT NULL,
        duration TEXT NOT NULL,
        workout_type_id INTEGER NOT NULL,
        FOREIGN KEY(workout_type_id) REFERENCES workout_type(id)
      )
    ''');

    //create workout_day table
    await db.execute('''
      CREATE TABLE workout_day (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        day_name TEXT NOT NULL,
        session_name TEXT NOT NULL
      )
    ''');

    //create workout_day_session table
    await db.execute('''
      CREATE TABLE workout_day_session (
        day_id INTEGER NOT NULL,
        session_id INTEGER NOT NULL,
        FOREIGN KEY(day_id) REFERENCES workout_day(id),
        FOREIGN KEY(session_id) REFERENCES workout_session(id)
      )
    ''');

    //create workout_week table
    await db.execute('''
      CREATE TABLE workout_week (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        week_number INTEGER NOT NULL
      )
    ''');

    //create week_day  table
    await db.execute('''
      CREATE TABLE week_day (
        week_id INTEGER NOT NULL,
        day_id INTEGER NOT NULL,
        FOREIGN KEY(week_id) REFERENCES workout_week(id),
        FOREIGN KEY(day_id) REFERENCES workout_day(id)
      )
    ''');
  }
  

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> query(String table) async {
    final db = await database;
    return await db.query(table);
  }

  Future<int> update(String table, Map<String, dynamic> data, String where, List<dynamic> whereArgs) async {
    final db = await database;
    return await db.update(table, data, where: where, whereArgs: whereArgs);
  }

  Future<int> delete(String table, String where, List<dynamic> whereArgs) async {
    final db = await database;
    return await db.delete(table, where: where, whereArgs: whereArgs);
  }
}
