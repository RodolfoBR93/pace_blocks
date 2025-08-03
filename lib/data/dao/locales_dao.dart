import '../database/database_helper.dart';

class LocalesDao {
  final dbHelper = DatabaseHelper();

  Future<void> insertLocale(String name) async {
    await dbHelper.insert('locales', {'name': name});
  }

  Future<List<Map<String, dynamic>>> getAllLocales() async {
    return await dbHelper.query('locales');
  }

  Future<void> updateLocale(int id, String name) async {
    await dbHelper.update(
      'locales',
      {'name': name},
      'id = ?',
      [id],
    );
  }

  
}