// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get home => 'Início';

  @override
  String get workouts => 'Treinos';

  @override
  String helloUser(String userName) {
    return 'Olá, $userName 👋';
  }

  @override
  String totalWorkouts(int count) {
    return '🏃 Total de treinos: $count';
  }

  @override
  String caloriesBurned(int calories) {
    return '🔥 Calorias queimadas: $calories kcal';
  }

  @override
  String totalTime(int minutes) {
    return '⏱️ Tempo total: $minutes min';
  }

  @override
  String get startWorkout => 'Começar treino';

  @override
  String get createWorkout => 'Criar Treino';

  @override
  String get save => 'Salvar';

  @override
  String get workoutName => 'Nome do Treino';

  @override
  String get workoutNameHint => 'Ex: Treino de Corrida Matinal';

  @override
  String get type => 'Tipo';

  @override
  String get selectType => 'Selecione um tipo';

  @override
  String get unit => 'Unidade';

  @override
  String get minutes => 'Minutos';

  @override
  String get meters => 'Metros';

  @override
  String get kilometers => 'Km';

  @override
  String value(String unit) {
    return 'Valor ($unit)';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get add => 'Adicionar';

  @override
  String get enterWorkoutName => 'Digite um nome para o treino';

  @override
  String get addAtLeastOneExercise =>
      'Adicione pelo menos um exercício ao treino';

  @override
  String workoutSavedSuccessfully(String workoutName, int sessionId) {
    return 'Treino \"$workoutName\" salvo com sucesso! ID da sessão: $sessionId';
  }

  @override
  String errorSavingWorkout(String error) {
    return 'Erro ao salvar treino: $error';
  }

  @override
  String get user => 'Usuário';
}
