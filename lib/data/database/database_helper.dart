
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
    //create locales table
    await db.execute('''
      CREATE TABLE locales (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        code TEXT NOT NULL
      )
    ''');

    //create workout_types table
      await db.execute('''
        CREATE TABLE workout_types (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          code TEXT NOT NULL,
          locale_id INTEGER NOT NULL,
          FOREIGN KEY(locale_id) REFERENCES locales(id)
        )
      ''');

    //create units_type table
    await db.execute('''
      CREATE TABLE units_type (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        locale_id INTEGER NOT NULL,
        FOREIGN KEY(locale_id) REFERENCES locales(id)
      )
    ''');

    //create user_peferences table
    await db.execute('''
      CREATE TABLE week_days (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        locale_id INTEGER NOT NULL,
        FOREIGN KEY(locale_id) REFERENCES locales(id)
      )
    ''');

    //create workout_sessions table
    await db.execute('''
      CREATE TABLE workout_sessions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        repetitions INTEGER NOT NULL
      )
    ''');

    //create user table
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name INTEGER NOT NULL
      )
    ''');

    //create user_peferences table
    await db.execute('''
      CREATE TABLE user_peferences (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        locale_id INTEGER NOT NULL,
        user_id INTEGER NOT NULL,
        FOREIGN KEY(user_id) REFERENCES user(id),
        FOREIGN KEY(locale_id) REFERENCES locales(id)
      )
    ''');
    //create workout_items table
    await db.execute('''
      CREATE TABLE workout_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        workout_type_id INTEGER NOT NULL,
        unit_type_id INTEGER NOT NULL,
        value INTEGER NOT NULL,
        workout_session_id INTEGER NOT NULL,
        FOREIGN KEY(workout_type_id) REFERENCES workout_types(id),
        FOREIGN KEY(unit_type_id) REFERENCES units_type(id),
        FOREIGN KEY(workout_session_id) REFERENCES workout_sessions(id)
      )
    ''');

    //create workout_day_session table
    await db.execute('''
      CREATE TABLE workout_day_session (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        day_id INTEGER NOT NULL,
        workout_sessions_id INTEGER NOT NULL,
        FOREIGN KEY(day_id) REFERENCES week_days(id),
        FOREIGN KEY(workout_sessions_id) REFERENCES workout_sessions(id)
      )
    ''');

    //create workout_week table
    await db.execute('''
      CREATE TABLE workout_week (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        workout_day_session_id INTEGER NOT NULL,
        FOREIGN KEY(workout_day_session_id) REFERENCES workout_day_session(id)
      )
    ''');
  }
  

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> query(String table,columns) async {
    final db = await database;
    return await db.query(table,columns: columns);
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
