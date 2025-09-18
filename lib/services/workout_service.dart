import 'package:pace_blocks/data/dao/workout_item_dao.dart';
import 'package:pace_blocks/data/dao/workout_session_dao.dart';
import 'package:pace_blocks/data/dao/workout_day_session_dao.dart';
import 'package:pace_blocks/data/dao/unit_type_dao.dart';
import 'package:pace_blocks/screens/create_workout/viewmodels/workout_item.dart';
import 'package:pace_blocks/screens/create_workout/viewmodels/unit_type.dart';
import 'dart:io';

class WorkoutService {
  final WorkoutSessionDao _sessionDao = WorkoutSessionDao();
  final WorkoutItemDao _itemDao = WorkoutItemDao();
  final WorkoutDaySessionDao _daySessionDao = WorkoutDaySessionDao();
  final UnitTypeDao _unitTypeDao = UnitTypeDao();

  Future<int> saveWorkout(
    List<WorkoutItem> workoutItems,
    String workoutName,
  ) async {
    if (workoutItems.isEmpty) {
      throw Exception('Não é possível salvar um treino vazio');
    }

    if (workoutName.trim().isEmpty) {
      throw Exception('Nome do treino é obrigatório');
    }

    // 1. Criar uma sessão de treino (para repetições)
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
        unitType: UnitType(
          id: unitTypeId,
          name: item.unitType.name,
          locale: item.unitType.locale,
        ),
        value: item.value,
      );
      updatedItems.add(updatedItem);
    }

    // 4. Salvar todos os items em uma transação
    await _itemDao.insertWorkoutItems(updatedItems);

    // 5. Criar o workout_day_session com o nome do treino
    final daySessionId = await _daySessionDao.insertWorkoutDaySession(
      workoutName.trim(),
      1, // Por enquanto usando day_id = 1 (pode ser configurado depois)
      sessionId,
    );

    return daySessionId;
  }

  Future<List<WorkoutItem>> getWorkoutBySession(int sessionId) async {
    return await _itemDao.getWorkoutItemsBySession(sessionId);
  }

  Future<List<WorkoutItem>> getAllWorkouts() async {
    return await _itemDao.getAllWorkoutItems();
  }
}
