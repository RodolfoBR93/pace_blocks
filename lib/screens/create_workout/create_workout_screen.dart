import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pace_blocks/data/dao/workout_type_dao.dart';
import 'package:pace_blocks/screens/create_workout/viewmodels/unit_type.dart';
import 'package:pace_blocks/screens/create_workout/viewmodels/workout_item.dart';
import 'package:pace_blocks/screens/create_workout/viewmodels/workout_type.dart';

class CreateWorkoutScreen extends StatefulWidget {
  const CreateWorkoutScreen({super.key});

  @override
  State<CreateWorkoutScreen> createState() => _CreateWorkoutScreenState();
}

class _CreateWorkoutScreenState extends State<CreateWorkoutScreen> {
  final WorkoutTypeDao _dao = WorkoutTypeDao();
  List<WorkoutType> _workoutTypes = [];
  WorkoutType? _selectedType;
  final List<String> _units = ['Minutos', 'Metros', 'Km'];
  String? _selectedUnit;

  @override
  void initState() {
    super.initState();
    _loadWorkoutTypes();
  }

  void _loadWorkoutTypes() async {
    final types = await _dao.getAllWorkoutTypes();
    if (types.isNotEmpty) {
      setState(() {
        _workoutTypes = types;
        _selectedType = types.first;
      });
    }
  }

  final TextEditingController _minutesController = TextEditingController();

  final List<WorkoutItem> _workouts = [];

  void _addWorkout() {
    final value = _minutesController.text;
    if (_selectedType != null && value.isNotEmpty && _selectedUnit != null) {
      setState(() {
        _workouts.add(
          WorkoutItem(
            id: null,
            workoutSessionId: null, 
            workoutType:_selectedType!,
            unitType: UnitType(name: 'km', locale: 1),//_units.indexOf(_selectedUnit!) + 1,
            value: value,
          ),
        );
        _minutesController.clear();
        _selectedUnit = null;
      });
    }
  }

  void _removeWorkout(int index) {
    setState(() {
      _workouts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Treino'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, _workouts);
            },
            child: const Text('Salvar', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Lista de treinos adicionados
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _workouts.length,
                itemBuilder: (context, index) {
                  final item = _workouts[index];
                  return Dismissible(
                    key: Key(item.id.toString()),
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
                        title:Text(item.workoutType.name),
                        trailing: Text(
                          '${item.value} ${_selectedUnit ?? 'Unidade'}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Linha com Dropdown + Minutos
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Row(
                  key: ValueKey(_selectedUnit == null),
                  children: [
                    // Dropdown de tipo
                    Expanded(
                      flex: 3,
                      child: DropdownButtonFormField<WorkoutType>(
                        value: _selectedType,
                        decoration: const InputDecoration(
                          labelText: 'Tipo',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _selectedType = value!;
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
                              value: null,
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
                                      _selectedUnit = '';
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

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _addWorkout,
                  icon: const Icon(Icons.add),
                  label: const Text('Adicionar'),
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
        ),
      ),
    );
  }
}
