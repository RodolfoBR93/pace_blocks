import 'package:pace_blocks/data/database/database_helper.dart';
import 'package:pace_blocks/data/database/populate_workout_types.dart';

Future<void> populateInitialData() async {
  try {
    final dbHelper = DatabaseHelper();
    final db = await dbHelper.database;

    final existingLocales = await db.query('locales', columns: null);
    if (existingLocales.isNotEmpty) {
      final sampleWorkoutType = await db.query(
        'workout_types',
        columns: null,
        limit: 1,
      );

      final sampleUnitType = await db.query(
        'units_type',
        columns: null,
        limit: 1,
      );

      if (sampleWorkoutType.isNotEmpty) {
        final localeId = sampleWorkoutType.first['locale_id'];
        if (localeId is String) {
          await dbHelper.clearDatabase();
          await _populateData();
        }
      }

      if (sampleUnitType.isNotEmpty) {
        final localeId = sampleUnitType.first['locale_id'];
        if (localeId is String) {
          await dbHelper.clearDatabase();
          await _populateData();
        }
      }
      return;
    }

    await _populateData();
  } catch (e) {
    rethrow;
  }
}

Future<void> _populateData() async {
  final dbHelper = DatabaseHelper();
  final db = await dbHelper.database;

  final locales = ['en', 'pt', 'es', 'fr', 'it', 'de', 'ja', 'zh', 'ru'];
  final localeIdMap = <String, int>{};

  for (final code in locales) {
    final id = await db.insert('locales', {'code': code});
    localeIdMap[code] = id;
  }

  final unitTypes = {
    'en': ['Minutes', 'Meters', 'Km'],
    'pt': ['Minutos', 'Metros', 'Km'],
    'es': ['Minutos', 'Metros', 'Km'],
    'fr': ['Minutes', 'Mètres', 'Km'],
    'it': ['Minuti', 'Metri', 'Km'],
    'de': ['Minuten', 'Meter', 'Km'],
    'ja': ['分', 'メートル', 'Km'],
    'zh': ['分钟', '米', 'Km'],
    'ru': ['Минуты', 'Метры', 'Km'],
  };

  for (final entry in unitTypes.entries) {
    final locale = entry.key;
    final names = entry.value;
    final localeId = localeIdMap[locale]!;
    for (final name in names) {
      await db.insert('units_type', {'name': name, 'locale_id': localeId});
    }
  }

  await populateInitialWorkoutTypesWithLocaleIds(localeIdMap);
}
