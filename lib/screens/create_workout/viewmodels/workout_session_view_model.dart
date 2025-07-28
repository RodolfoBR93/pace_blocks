import 'package:pace_blocks/screens/create_workout/viewmodels/workout_type.dart';

class WorkoutSessionViewModel {
  final int repetitions;
  final String duration;
  final WorkoutType type;

  WorkoutSessionViewModel({
    required this.repetitions,
    required this.duration,
    required this.type,
  });
}

// //falta traduzir e buscar do repository
// enum WorkoutType {
//   caminhadaLeve,
//   caminhada,
//   trote,
//   corridaLeve,
//   corridaModerada,
//   corridaForte, 
//   corridaMuitoForte,
//   vo2Max,
//   descanso,
//   treinoAlongamento
// }
