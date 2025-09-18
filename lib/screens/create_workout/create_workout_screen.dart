import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pace_blocks/data/dao/workout_type_dao.dart';
import 'package:pace_blocks/screens/create_workout/viewmodels/unit_type.dart';
import 'package:pace_blocks/screens/create_workout/viewmodels/workout_item.dart';
import 'package:pace_blocks/screens/create_workout/viewmodels/workout_type.dart';
import 'package:pace_blocks/services/workout_service.dart';

class CreateWorkoutScreen extends StatefulWidget {
  const CreateWorkoutScreen({super.key});

  @override
  State<CreateWorkoutScreen> createState() => _CreateWorkoutScreenState();
}

class _CreateWorkoutScreenState extends State<CreateWorkoutScreen> {
  final WorkoutTypeDao _dao = WorkoutTypeDao();
  final WorkoutService _workoutService = WorkoutService();
  List<WorkoutType> _workoutTypes = [];
  WorkoutType? _selectedType;
  final List<String> _units = ['Minutos', 'Metros', 'Km'];
  String? _selectedUnit;
  bool _isLoading = true;
  bool _isSaving = false;
  bool _isEditing = false;
  bool _isAdding = false;
  int? _editingIndex;

  @override
  void initState() {
    super.initState();
    _loadWorkoutTypes();
  }

  void _loadWorkoutTypes() async {
    try {
      final types = await _dao.getAllWorkoutTypes();
      if (types.isNotEmpty) {
        setState(() {
          _workoutTypes = types;
          _selectedType = null; // Não definir tipo inicial
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  final TextEditingController _minutesController = TextEditingController();
  final TextEditingController _workoutNameController = TextEditingController();

  final List<WorkoutItem> _workouts = [];

  void _startAdding() {
    setState(() {
      _isAdding = true;
      _selectedType = null;
      _selectedUnit = null;
      _minutesController.clear();
    });
  }

  void _confirmAddWorkout() {
    final value = _minutesController.text;
    if (_selectedType != null && value.isNotEmpty && _selectedUnit != null) {
      setState(() {
        if (_isEditing && _editingIndex != null) {
          // Editando item existente
          _workouts[_editingIndex!] = WorkoutItem(
            id: _workouts[_editingIndex!].id,
            workoutSessionId: _workouts[_editingIndex!].workoutSessionId,
            workoutType: _selectedType!,
            unitType: UnitType(name: _selectedUnit!, locale: 1),
            value: value,
          );
          _isEditing = false;
          _editingIndex = null;
        } else {
          // Adicionando novo item
          _workouts.add(
            WorkoutItem(
              id: null,
              workoutSessionId: null,
              workoutType: _selectedType!,
              unitType: UnitType(name: _selectedUnit!, locale: 1),
              value: value,
            ),
          );
        }
        _minutesController.clear();
        _selectedType = null;
        _selectedUnit = null;
        _isAdding = false;
      });
    }
  }

  void _removeWorkout(int index) {
    setState(() {
      _workouts.removeAt(index);
    });
  }

  void _editWorkout(int index) {
    final item = _workouts[index];
    setState(() {
      _isEditing = true;
      _isAdding = true; // Mostrar campos durante edição
      _editingIndex = index;
      _selectedType = item.workoutType;
      _selectedUnit = item.unitType.name;
      _minutesController.text = item.value;
    });
  }

  void _cancelEdit() {
    setState(() {
      _isEditing = false;
      _isAdding = false;
      _editingIndex = null;
      _minutesController.clear();
      _selectedType = null;
      _selectedUnit = null;
    });
  }

  Future<void> _saveWorkout() async {
    if (_workoutNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Digite um nome para o treino'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (_workouts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Adicione pelo menos um exercício ao treino'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final sessionId = await _workoutService.saveWorkout(
        _workouts,
        _workoutNameController.text.trim(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Treino "${_workoutNameController.text.trim()}" salvo com sucesso! ID da sessão: $sessionId',
            ),
            backgroundColor: Colors.green,
          ),
        );

        // Limpar o formulário após salvar com sucesso
        setState(() {
          _workouts.clear();
          _minutesController.clear();
          _workoutNameController.clear();
          _selectedType = null; // Não definir tipo inicial
          _selectedUnit = null;
          _isEditing = false;
          _isAdding = false;
          _editingIndex = null;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao salvar treino: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Criar Treino'),
        actions: [
          TextButton(
            onPressed: _isSaving ? null : _saveWorkout,
            child: _isSaving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Salvar', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Campo de nome do treino
              TextField(
                controller: _workoutNameController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Treino',
                  hintText: 'Ex: Treino de Corrida Matinal',
                  border: OutlineInputBorder(),
                ),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),

              // Lista de treinos adicionados
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _workouts.length,
                itemBuilder: (context, index) {
                  final item = _workouts[index];
                  return Dismissible(
                    key: Key('workout_$index'),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) => _removeWorkout(index),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ListTile(
                        title: Text(item.workoutType.name),
                        subtitle: Text(
                          '${item.value} ${item.unitType.name}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _editWorkout(index),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Campos de tipo e valor (só aparecem quando adicionando ou editando)
              if (_isAdding) ...[
                // Linha com Dropdown + Minutos
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Row(
                    key: ValueKey(_selectedUnit == null),
                    children: [
                      // Dropdown de tipo
                      Expanded(
                        flex: 3,
                        child: _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : DropdownButtonFormField<WorkoutType>(
                                initialValue: _selectedType,
                                decoration: const InputDecoration(
                                  labelText: 'Tipo',
                                  hintText: 'Selecione um tipo',
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedType = value;
                                    _selectedUnit = null;
                                    _minutesController.clear();
                                  });
                                },
                                items: _workoutTypes.map((type) {
                                  return DropdownMenuItem<WorkoutType>(
                                    value: type,
                                    child: Text(type.name),
                                  );
                                }).toList(),
                              ),
                      ),
                      const SizedBox(width: 12),

                      // Unidade ou valor
                      Expanded(
                        flex: 2,
                        child: _selectedUnit == null
                            ? DropdownButtonFormField<String>(
                                initialValue: null,
                                hint: const Text('Unidade'),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedUnit = value!;
                                  });
                                },
                                items: _units.map((unit) {
                                  return DropdownMenuItem(
                                    value: unit,
                                    child: Text(unit),
                                  );
                                }).toList(),
                              )
                            : TextField(
                                controller: _minutesController,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: false,
                                      signed: false,
                                    ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  labelText: 'Valor ($_selectedUnit)',
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      setState(() {
                                        _selectedUnit = null;
                                        _minutesController.clear();
                                      });
                                    },
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              Row(
                children: [
                  if (_isAdding) ...[
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _cancelEdit,
                        icon: const Icon(Icons.cancel),
                        label: const Text('Cancelar'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _isAdding ? _confirmAddWorkout : _startAdding,
                      icon: Icon(_isAdding ? Icons.save : Icons.add),
                      label: Text(_isAdding ? 'Salvar' : 'Adicionar'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
