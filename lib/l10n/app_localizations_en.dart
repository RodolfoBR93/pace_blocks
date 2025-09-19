// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get workouts => 'Workouts';

  @override
  String helloUser(String userName) {
    return 'Hello, $userName 👋';
  }

  @override
  String totalWorkouts(int count) {
    return '🏃 Total workouts: $count';
  }

  @override
  String caloriesBurned(int calories) {
    return '🔥 Calories burned: $calories kcal';
  }

  @override
  String totalTime(int minutes) {
    return '⏱️ Total time: $minutes min';
  }

  @override
  String get startWorkout => 'Start workout';

  @override
  String get createWorkout => 'Create Workout';

  @override
  String get save => 'Save';

  @override
  String get workoutName => 'Workout Name';

  @override
  String get workoutNameHint => 'Ex: Morning Running Workout';

  @override
  String get type => 'Type';

  @override
  String get selectType => 'Select a type';

  @override
  String get unit => 'Unit';

  @override
  String get minutes => 'Minutes';

  @override
  String get meters => 'Meters';

  @override
  String get kilometers => 'Km';

  @override
  String value(String unit) {
    return 'Value ($unit)';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get add => 'Add';

  @override
  String get enterWorkoutName => 'Enter a name for the workout';

  @override
  String get addAtLeastOneExercise =>
      'Add at least one exercise to the workout';

  @override
  String workoutSavedSuccessfully(String workoutName, int sessionId) {
    return 'Workout \"$workoutName\" saved successfully! Session ID: $sessionId';
  }

  @override
  String errorSavingWorkout(String error) {
    return 'Error saving workout: $error';
  }

  @override
  String get user => 'User';
}
