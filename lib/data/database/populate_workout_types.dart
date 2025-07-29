import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:pace_blocks/data/dao/workout_type_dao.dart';
import 'package:pace_blocks/screens/create_workout/viewmodels/workout_type.dart';

Future<void> populateInitialWorkoutTypes() async {
  final dao = WorkoutTypeDao();
  final existing = await dao.getAllWorkoutTypes();
  if (existing.isNotEmpty) return;

  final locale = PlatformDispatcher.instance.locale.languageCode;

  final List<WorkoutType> types = locale == 'pt'
      ? [
          WorkoutType(name: 'Caminhada', code: 'CA', locale: locale),
          WorkoutType(name: 'Trote', code: 'TR', locale: locale),
          WorkoutType(name: 'Corrida Leve', code: 'CL', locale: locale),
          WorkoutType(name: 'Corrida Moderada', code: 'CM', locale: locale),
          WorkoutType(name: 'Corrida Forte', code: 'CF', locale: locale),
          WorkoutType(name: 'Corrida Muito Forte', code: 'CMF', locale: locale),
          WorkoutType(name: 'Vo2 Max', code: 'VO2', locale: locale),
          WorkoutType(name: 'Descanso', code: 'DE', locale: locale),
          WorkoutType(name: 'Treino Alongamento', code: 'TA', locale: locale),
        ]
      : [
          WorkoutType(name: 'Walk', code: 'CA', locale: locale),
          WorkoutType(name: 'Jog', code: 'TR', locale: locale),
          WorkoutType(name: 'Light Run', code: 'CL', locale: locale),
          WorkoutType(name: 'Moderate Run', code: 'CM', locale: locale),
          WorkoutType(name: 'Strong Run', code: 'CF', locale: locale),
          WorkoutType(name: 'Very Strong Run', code: 'CMF', locale: locale),
          WorkoutType(name: 'VO2 Max', code: 'VO2', locale: locale),
          WorkoutType(name: 'Rest', code: 'DE', locale: locale),
          WorkoutType(name: 'Stretching', code: 'TA', locale: locale),
        ];

  for (final type in types) {
    await dao.insertWorkoutType(type);
  }
}
