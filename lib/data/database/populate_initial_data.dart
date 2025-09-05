import 'package:pace_blocks/data/database/database_helper.dart';
import 'package:pace_blocks/data/database/populate_workout_types.dart';

Future<void> populateInitialData() async {
  try {
    final dbHelper = DatabaseHelper();
    final db = await dbHelper.database;

    final existingLocales = await db.query('locales', columns: null);
    if (existingLocales.isNotEmpty) {
      // Verificar se os dados estão corretos
      final sampleWorkoutType = await db.query(
        'workout_types',
        columns: null,
        limit: 1,
      );
      if (sampleWorkoutType.isNotEmpty) {
        final localeId = sampleWorkoutType.first['locale_id'];
        if (localeId is String) {
          // Dados incorretos, limpar e recriar
          await dbHelper.clearDatabase();
          await _populateData();
        }
      }
      return;
    }

    await _populateData();
  } catch (e) {
    // Erro silencioso - dados podem já existir
  }
}

Future<void> _populateData() async {
  final dbHelper = DatabaseHelper();
  final db = await dbHelper.database;

  // Locales
  final locales = ['en', 'pt', 'es', 'fr', 'it', 'de', 'ja', 'zh', 'ru'];
  final localeIdMap = <String, int>{};

  for (final code in locales) {
    final id = await db.insert('locales', {'code': code});
    localeIdMap[code] = id;
  }

  // Units types por idioma
  final unitTypes = {
    'en': ['Minutes', 'Meters', 'Kilometers'],
    'pt': ['Minutos', 'Metros', 'Quilômetros'],
    'es': ['Minutos', 'Metros', 'Kilómetros'],
    'fr': ['Minutes', 'Mètres', 'Kilomètres'],
    'it': ['Minuti', 'Metri', 'Chilometri'],
    'de': ['Minuten', 'Meter', 'Kilometer'],
    'ja': ['分', 'メートル', 'キロメートル'],
    'zh': ['分钟', '米', '公里'],
    'ru': ['Минуты', 'Метры', 'Километры'],
  };

  for (final entry in unitTypes.entries) {
    final locale = entry.key;
    final names = entry.value;
    final localeId = localeIdMap[locale]!;
    for (final name in names) {
      await db.insert('units_type', {'name': name, 'locale_id': localeId});
    }
  }

  // Workout types (chamada reaproveitada)
  await populateInitialWorkoutTypesWithLocaleIds(localeIdMap);
}
