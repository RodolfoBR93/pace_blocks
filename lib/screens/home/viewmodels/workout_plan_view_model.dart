import 'package:flutter/material.dart';
import 'package:pace_blocks/screens/home/viewmodels/week_view_model.dart';

class WorkoutPlanViewModel extends ChangeNotifier {
  final List<WeekViewModel> weeks;

  WorkoutPlanViewModel(this.weeks);

  WeekViewModel getWeek(int index) => weeks[index];

  int get totalWeeks => weeks.length;
}
