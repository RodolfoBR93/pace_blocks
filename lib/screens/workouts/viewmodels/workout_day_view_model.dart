import 'package:flutter/material.dart';
import 'package:pace_blocks/screens/workouts/viewmodels/workout_session_view_model.dart';

class WorkoutDayViewModel extends ChangeNotifier {
  final String dayName;
  final String sessionName;
  final List<WorkoutSessionViewModel> sessions;

  WorkoutDayViewModel({
    required this.dayName,
    required this.sessionName,
    required this.sessions,
  });

  bool get isRestDay => sessions.isEmpty;
}
