import '../database/database_helper.dart';

class UnitTypeDao {
  final dbHelper = DatabaseHelper();

  Future<int> insertUnitType(String name, int localeId) async {
    return await dbHelper.insert('units_type', {
      'name': name,
      'locale_id': localeId,
    });
  }

  Future<List<Map<String, dynamic>>> getAllUnitTypes() async {
    return await dbHelper.query('units_type', columns: null);
  }

  Future<List<Map<String, dynamic>>> getUnitTypesByLocale(
    String localeCode,
  ) async {
    final db = await dbHelper.database;
    return await db.rawQuery(
      '''
      SELECT ut.id, ut.name, ut.locale_id
      FROM units_type ut
      JOIN locales l ON ut.locale_id = l.id
      WHERE l.code = ?
    ''',
      [localeCode],
    );
  }

  Future<void> updateUnitType(int id, String name, int localeId) async {
    await dbHelper.update(
      'units_type',
      {'name': name, 'locale_id': localeId},
      'id = ?',
      [id],
    );
  }

  Future<void> deleteUnitType(int id) async {
    await dbHelper.delete('units_type', 'id = ?', [id]);
  }
}
