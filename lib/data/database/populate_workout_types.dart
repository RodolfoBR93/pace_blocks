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
    WorkoutType(name: 'Walk', code: 'CA', locale: locale),
    WorkoutType(name: 'Jog', code: 'TR', locale: locale),
    WorkoutType(name: 'Light Run', code: 'CL', locale: locale),
    WorkoutType(name: 'Moderate Run', code: 'CM', locale: locale),
    WorkoutType(name: 'Strong Run', code: 'CF', locale: locale),
    WorkoutType(name: 'Very Strong Run', code: 'CMF', locale: locale),
    WorkoutType(name: 'VO2 Max', code: 'VO2', locale: locale),
    WorkoutType(name: 'Rest', code: 'DE', locale: locale),
    WorkoutType(name: 'Stretching', code: 'TA', locale: locale)
  ]);        
  locale = 'pt'; // Portuguese
  types.addAll([
    WorkoutType(name: 'Caminhada', code: 'CA', locale: locale),
    WorkoutType(name: 'Trote', code: 'TR', locale: locale),
    WorkoutType(name: 'Corrida Leve', code: 'CL', locale: locale),
    WorkoutType(name: 'Corrida Moderada', code: 'CM', locale: locale),
    WorkoutType(name: 'Corrida Forte', code: 'CF', locale: locale),
    WorkoutType(name: 'Corrida Muito Forte', code: 'CMF', locale: locale),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: locale),
    WorkoutType(name: 'Descanso', code: 'DE', locale: locale),
    WorkoutType(name: 'Treino Alongamento', code: 'TA', locale: locale),
  ]);
  locale = 'es'; // Spanish
  types.addAll([
    WorkoutType(name: 'Caminata', code: 'CA', locale: locale),
    WorkoutType(name: 'Trote', code: 'TR', locale: locale),
    WorkoutType(name: 'Carrera Ligera', code: 'CL', locale: locale),
    WorkoutType(name: 'Carrera Moderada', code: 'CM', locale: locale),
    WorkoutType(name: 'Carrera Fuerte', code: 'CF', locale: locale),
    WorkoutType(name: 'Carrera Muy Fuerte', code: 'CMF', locale: locale),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: locale),
    WorkoutType(name: 'Descanso', code: 'DE', locale: locale),
    WorkoutType(name: 'Estiramiento', code: 'TA', locale: locale),
  ]);
  locale = 'fr'; // French
  types.addAll([
    WorkoutType(name: 'Marche', code: 'CA', locale: locale),
    WorkoutType(name: 'Trot', code: 'TR', locale: locale),
    WorkoutType(name: 'Course Légère', code: 'CL', locale: locale),
    WorkoutType(name: 'Course Modérée', code: 'CM', locale: locale),
    WorkoutType(name: 'Course Forte', code: 'CF', locale: locale),
    WorkoutType(name: 'Course Très Forte', code: 'CMF', locale: locale),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: locale),
    WorkoutType(name: 'Repos', code: 'DE', locale: locale),
    WorkoutType(name: 'Étirement', code: 'TA', locale: locale),
  ]);
  locale = 'it'; // Italian
  types.addAll([
    WorkoutType(name: 'Camminata', code: 'CA', locale: locale),
    WorkoutType(name: 'Trotto', code: 'TR', locale: locale),
    WorkoutType(name: 'Corsa Leggera', code: 'CL', locale: locale),
    WorkoutType(name: 'Corsa Moderata', code: 'CM', locale: locale),
    WorkoutType(name: 'Corsa Forte', code: 'CF', locale: locale),
    WorkoutType(name: 'Corsa Molto Forte', code: 'CMF', locale: locale),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: locale),
    WorkoutType(name: 'Riposo', code: 'DE', locale: locale),
    WorkoutType(name: 'Stretching', code: 'TA', locale: locale),
  ]);
  locale = 'de'; // German
  types.addAll([
    WorkoutType(name: 'Gehen', code: 'CA', locale: locale),
    WorkoutType(name: 'Trab', code: 'TR', locale: locale),
    WorkoutType(name: 'Leichtes Laufen', code: 'CL', locale: locale),
    WorkoutType(name: 'Moderat Laufen', code: 'CM', locale: locale),
    WorkoutType(name: 'Schnelles Laufen', code: 'CF', locale: locale),
    WorkoutType(name: 'Sehr Schnelles Laufen', code: 'CMF', locale: locale),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: locale),
    WorkoutType(name: 'Ruhe', code: 'DE', locale: locale),
    WorkoutType(name: 'Dehnen', code: 'TA', locale: locale),
  ]);
  locale = 'ja'; // Japanese
  types.addAll([
    WorkoutType(name: 'ウォーキング', code: 'CA', locale: locale),
    WorkoutType(name: 'ジョギング', code: 'TR', locale: locale),
    WorkoutType(name: '軽いランニング', code: 'CL', locale: locale),
    WorkoutType(name: '中程度のランニング', code: 'CM', locale: locale),
    WorkoutType(name: '速いランニング', code: 'CF', locale: locale),
    WorkoutType(name: '非常に速いランニング', code: 'CMF', locale: locale),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: locale),
    WorkoutType(name: '休息', code: 'DE', locale: locale),
    WorkoutType(name: 'ストレッチング', code: 'TA', locale: locale),
  ]);
  locale = 'zh'; // Chinese
  types.addAll([
    WorkoutType(name: '步行', code: 'CA', locale: locale),
    WorkoutType(name: '慢跑', code: 'TR', locale: locale),
    WorkoutType(name: '轻松跑步', code: 'CL', locale: locale),
    WorkoutType(name: '中等跑步', code: 'CM', locale: locale),
    WorkoutType(name: '快速跑步', code: 'CF', locale: locale),
    WorkoutType(name: '非常快速跑步', code: 'CMF', locale: locale),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: locale),
    WorkoutType(name: '休息', code: 'DE', locale: locale),
    WorkoutType(name: '拉伸', code: 'TA', locale: locale),
  ]);
  locale = 'ru'; // Russian
  types.addAll([
    WorkoutType(name: 'Ходьба', code: 'CA', locale: locale),
    WorkoutType(name: 'Бег трусцой', code: 'TR', locale: locale),
    WorkoutType(name: 'Легкий бег', code: 'CL', locale: locale),
    WorkoutType(name: 'Умеренный бег', code: 'CM', locale: locale),
    WorkoutType(name: 'Быстрый бег', code: 'CF', locale: locale),
    WorkoutType(name: 'Очень быстрый бег', code: 'CMF', locale: locale),
    WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: locale),
    WorkoutType(name: 'Отдых', code: 'DE', locale: locale),
    WorkoutType(name: 'Растяжка', code: 'TA', locale: locale),
  ]);
  for (final type in types) {
    await dao.insertWorkoutType(type);
  }
}
