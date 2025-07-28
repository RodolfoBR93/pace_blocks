import 'package:flutter/material.dart';
import 'package:pace_blocks/screens/home/viewmodels/workout_day_view_model.dart';

class WeekViewModel extends ChangeNotifier {
  final int weekNumber;
  final List<WorkoutDayViewModel> days;

  WeekViewModel({
    required this.weekNumber,
    required this.days,
  });

  WorkoutDayViewModel getDay(int index) => days[index];
}
