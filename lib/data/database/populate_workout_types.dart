import 'package:pace_blocks/data/dao/workout_type_dao.dart';
import 'package:pace_blocks/screens/create_workout/viewmodels/workout_type.dart';

Future<void> populateInitialWorkoutTypesWithLocaleIds(Map<String, int> localeIdMap) async {
  final dao = WorkoutTypeDao();
  final existing = await dao.getAllWorkoutTypes();
  if (existing.isNotEmpty) return;

  //final locale = PlatformDispatcher.instance.locale.languageCode;
  String locale = 'en'; // English
  final List<WorkoutType> types = <WorkoutType>[];

  types.addAll([
    WorkoutType(name: 'Walk', code: 'CA', locale: localeIdMap['en']!),
    WorkoutType(name: 'Jog', code: 'TR', locale: localeIdMap['en']!),
    WorkoutType(name: 'Light Run', code: 'CL', locale: localeIdMap['en']!),
    WorkoutType(name: 'Moderate Run', code: 'CM', locale: localeIdMap['en']!),
    WorkoutType(name: 'Strong Run', code: 'CF', locale: localeIdMap['en']!),
    WorkoutType(name: 'Very Strong Run', code: 'CMF', locale: localeIdMap['en']!),
    WorkoutType(name: 'VO2 Max', code: 'VO2', locale: localeIdMap['en']!),
    WorkoutType(name: 'Rest', code: 'DE', locale: localeIdMap['en']!),
    WorkoutType(name: 'Stretching', code: 'TA', locale: localeIdMap['en']!)
  ]);        
  locale = 'pt'; // Portuguese
  types.addAll([
    WorkoutType(name: 'Caminhada', code: 'CA', locale: localeIdMap['pt']!),
    WorkoutType(name: 'Trote', code: 'TR', locale: localeIdMap['pt']!),
    WorkoutType(name: 'Corrida Leve', code: 'CL', locale: localeIdMap['pt']!),
    WorkoutType(name: 'Corrida Moderada', code: 'CM', locale: localeIdMap['pt']!),
    WorkoutType(name: 'Corrida Forte', code: 'CF', locale: localeIdMap['pt']!),
    WorkoutType(name: 'Corrida Muito Forte', code: 'CMF', locale: localeIdMap['pt']!),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: localeIdMap['pt']!),
    WorkoutType(name: 'Descanso', code: 'DE', locale: localeIdMap['pt']!),
    WorkoutType(name: 'Treino Alongamento', code: 'TA', locale: localeIdMap['pt']!),
  ]);
  locale = 'es'; // Spanish
  types.addAll([
    WorkoutType(name: 'Caminata', code: 'CA', locale: localeIdMap['es']!),
    WorkoutType(name: 'Trote', code: 'TR', locale: localeIdMap['es']!),
    WorkoutType(name: 'Carrera Ligera', code: 'CL', locale: localeIdMap['es']!),
    WorkoutType(name: 'Carrera Moderada', code: 'CM', locale: localeIdMap['es']!),
    WorkoutType(name: 'Carrera Fuerte', code: 'CF', locale: localeIdMap['es']!),
    WorkoutType(name: 'Carrera Muy Fuerte', code: 'CMF', locale: localeIdMap['es']!),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: localeIdMap['es']!),
    WorkoutType(name: 'Descanso', code: 'DE', locale: localeIdMap['es']!),
    WorkoutType(name: 'Estiramiento', code: 'TA', locale: localeIdMap['es']!),
  ]);
  locale = 'fr'; // French
  types.addAll([
    WorkoutType(name: 'Marche', code: 'CA', locale: localeIdMap['fr']!),
    WorkoutType(name: 'Trot', code: 'TR', locale: localeIdMap['fr']!),
    WorkoutType(name: 'Course Légère', code: 'CL', locale: localeIdMap['fr']!),
    WorkoutType(name: 'Course Modérée', code: 'CM', locale: localeIdMap['fr']!),
    WorkoutType(name: 'Course Forte', code: 'CF', locale: localeIdMap['fr']!),
    WorkoutType(name: 'Course Très Forte', code: 'CMF', locale: localeIdMap['fr']!),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: localeIdMap['fr']!),
    WorkoutType(name: 'Repos', code: 'DE', locale: localeIdMap['fr']!),
    WorkoutType(name: 'Étirement', code: 'TA', locale: localeIdMap['fr']!),
  ]);
  locale = 'it'; // Italian
  types.addAll([
    WorkoutType(name: 'Camminata', code: 'CA', locale: localeIdMap['it']!),
    WorkoutType(name: 'Trotto', code: 'TR', locale: localeIdMap['it']!),
    WorkoutType(name: 'Corsa Leggera', code: 'CL', locale: localeIdMap['it']!),
    WorkoutType(name: 'Corsa Moderata', code: 'CM', locale: localeIdMap['it']!),
    WorkoutType(name: 'Corsa Forte', code: 'CF', locale: localeIdMap['it']!),
    WorkoutType(name: 'Corsa Molto Forte', code: 'CMF', locale: localeIdMap['it']!),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: localeIdMap['it']!),
    WorkoutType(name: 'Riposo', code: 'DE', locale: localeIdMap['it']!),
    WorkoutType(name: 'Stretching', code: 'TA', locale: localeIdMap['it']!),
  ]);
  locale = 'de'; // German
  types.addAll([
    WorkoutType(name: 'Gehen', code: 'CA', locale: localeIdMap['de']!),
    WorkoutType(name: 'Trab', code: 'TR', locale: localeIdMap['de']!),
    WorkoutType(name: 'Leichtes Laufen', code: 'CL', locale: localeIdMap['de']!),
    WorkoutType(name: 'Moderat Laufen', code: 'CM', locale: localeIdMap['de']!),
    WorkoutType(name: 'Schnelles Laufen', code: 'CF', locale: localeIdMap['de']!),
    WorkoutType(name: 'Sehr Schnelles Laufen', code: 'CMF', locale: localeIdMap['de']!),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: localeIdMap['de']!),
    WorkoutType(name: 'Ruhe', code: 'DE', locale: localeIdMap['de']!),
    WorkoutType(name: 'Dehnen', code: 'TA', locale: localeIdMap['de']!),
  ]);
  locale = 'ja'; // Japanese
  types.addAll([
    WorkoutType(name: 'ウォーキング', code: 'CA', locale: localeIdMap['ja']!),
    WorkoutType(name: 'ジョギング', code: 'TR', locale: localeIdMap['ja']!),
    WorkoutType(name: '軽いランニング', code: 'CL', locale: localeIdMap['ja']!),
    WorkoutType(name: '中程度のランニング', code: 'CM', locale: localeIdMap['ja']!),
    WorkoutType(name: '速いランニング', code: 'CF', locale: localeIdMap['ja']!),
    WorkoutType(name: '非常に速いランニング', code: 'CMF', locale: localeIdMap['ja']!),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: localeIdMap['ja']!),
    WorkoutType(name: '休息', code: 'DE', locale: localeIdMap['ja']!),
    WorkoutType(name: 'ストレッチング', code: 'TA', locale: localeIdMap['ja']!),
  ]);
  locale = 'zh'; // Chinese
  types.addAll([
    WorkoutType(name: '步行', code: 'CA', locale: localeIdMap['zh']!),
    WorkoutType(name: '慢跑', code: 'TR', locale: localeIdMap['zh']!),
    WorkoutType(name: '轻松跑步', code: 'CL', locale: localeIdMap['zh']!),
    WorkoutType(name: '中等跑步', code: 'CM', locale: localeIdMap['zh']!),
    WorkoutType(name: '快速跑步', code: 'CF', locale: localeIdMap['zh']!),
    WorkoutType(name: '非常快速跑步', code: 'CMF', locale: localeIdMap['zh']!),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: localeIdMap['zh']!),
    WorkoutType(name: '休息', code: 'DE', locale: localeIdMap['zh']!),
    WorkoutType(name: '拉伸', code: 'TA', locale: localeIdMap['zh']!),
  ]);
  locale = 'ru'; // Russian
  types.addAll([
    WorkoutType(name: 'Ходьба', code: 'CA', locale: localeIdMap['ru']!),
    WorkoutType(name: 'Бег трусцой', code: 'TR', locale: localeIdMap['ru']!),
    WorkoutType(name: 'Легкий бег', code: 'CL', locale: localeIdMap['ru']!),
    WorkoutType(name: 'Умеренный бег', code: 'CM', locale: localeIdMap['ru']!),
    WorkoutType(name: 'Быстрый бег', code: 'CF', locale: localeIdMap['ru']!),
    WorkoutType(name: 'Очень быстрый бег', code: 'CMF', locale: localeIdMap['ru']!),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: localeIdMap['ru']!),
    WorkoutType(name: 'Отдых', code: 'DE', locale: localeIdMap['ru']!),
    WorkoutType(name: 'Растяжка', code: 'TA', locale: localeIdMap['ru']!),
  ]);
  for (final type in types) {
    await dao.insertWorkoutType(type);
  }
}
