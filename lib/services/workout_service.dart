import 'package:pace_blocks/data/dao/workout_item_dao.dart';
import 'package:pace_blocks/data/dao/workout_session_dao.dart';
import 'package:pace_blocks/data/dao/unit_type_dao.dart';
import 'package:pace_blocks/screens/create_workout/viewmodels/workout_item.dart';
import 'dart:io';

class WorkoutService {
  final WorkoutSessionDao _sessionDao = WorkoutSessionDao();
  final WorkoutItemDao _itemDao = WorkoutItemDao();
  final UnitTypeDao _unitTypeDao = UnitTypeDao();

  Future<int> saveWorkout(List<WorkoutItem> workoutItems) async {
    if (workoutItems.isEmpty) {
      throw Exception('Não é possível salvar um treino vazio');
    }

    // 1. Criar uma sessão de treino
    final sessionId = await _sessionDao.insertWorkoutSession(
      1,
    ); // 1 repetição por padrão

    // 2. Obter o ID do tipo de unidade para cada item
    final deviceLocale = Platform.localeName.split('_')[0];
    final unitTypes = await _unitTypeDao.getUnitTypesByLocale(deviceLocale);

    // Criar um mapa de nome -> id para facilitar a busca
    final unitTypeMap = <String, int>{};
    for (final unitType in unitTypes) {
      unitTypeMap[unitType['name']] = unitType['id'];
    }

    // 3. Atualizar os workout items com os IDs corretos
    final updatedItems = <WorkoutItem>[];
    for (final item in workoutItems) {
      final unitTypeId = unitTypeMap[item.unitType.name];
      if (unitTypeId == null) {
        throw Exception(
          'Tipo de unidade "${item.unitType.name}" não encontrado',
        );
      }

      final updatedItem = WorkoutItem(
        id: null,
        workoutSessionId: sessionId,
        workoutType: item.workoutType,
        unitType: item.unitType,
        value: item.value,
      );
      updatedItems.add(updatedItem);
    }

    // 4. Salvar todos os items em uma transação
    await _itemDao.insertWorkoutItems(updatedItems);

    return sessionId;
  }

  Future<List<WorkoutItem>> getWorkoutBySession(int sessionId) async {
    return await _itemDao.getWorkoutItemsBySession(sessionId);
  }

  Future<List<WorkoutItem>> getAllWorkouts() async {
    return await _itemDao.getAllWorkoutItems();
  }
}
