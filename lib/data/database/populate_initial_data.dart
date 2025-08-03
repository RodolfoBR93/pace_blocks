import 'package:pace_blocks/data/database/database_helper.dart';
import 'package:pace_blocks/data/database/populate_workout_types.dart';

Future<void> populateInitialData() async {
  final db = await DatabaseHelper().database;

  final existingLocales = await db.query('locales');
  if (existingLocales.isNotEmpty) return; 

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
