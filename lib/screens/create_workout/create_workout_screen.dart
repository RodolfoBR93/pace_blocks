import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateWorkout extends StatefulWidget {
  const CreateWorkout({super.key});

  @override
  State<CreateWorkout> createState() => _CreateWorkoutState();
}

const Map<String, String> workoutType = {
  'Caminhada': 'CA',
  'Trote': 'TR',
  'Corrida Leve': 'CL',
  'Corrida Moderada': 'CM',
  'Corrida Forte': 'CF',
  'Corrida Muito Forte': 'CMF',
  'Vo2 Max': 'VO2',
  'Descanso': 'DE',
  'Treino Alongamento': 'TA'
};

class WorkoutItem {
  final String type;
  final String minutes;

  WorkoutItem({required this.type, required this.minutes});
}

class _CreateWorkoutState extends State<CreateWorkout> {
  String? selectedKey = workoutType.keys.first;
  final TextEditingController _minutesController = TextEditingController();

  final List<WorkoutItem> _workouts = [];

  void _addWorkout() {
    final minutes = _minutesController.text;
    if (selectedKey != null && minutes.isNotEmpty) {
      setState(() {
        _workouts.add(WorkoutItem(type: selectedKey!, minutes: minutes));
        _minutesController.clear();
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
      appBar: AppBar(title: const Text('Criar Treino')),
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
                    key: Key('${item.type}-$index'),
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
                        title: Text(item.type),
                        trailing: Text('${item.minutes} min'),
                      ),
                    ),
                  );
                },
              ),
          
              const SizedBox(height: 24),
          
              // Linha com Dropdown + Minutos
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: selectedKey,
                      decoration: const InputDecoration(
                        labelText: 'Tipo',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedKey = value!;
                        });
                      },
                      items: workoutType.keys.map((String key) {
                        return DropdownMenuItem<String>(
                          value: key,
                          child: Text(key),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _minutesController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: false,
                        signed: false,
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: 'Minutos',
                        hintText: 'Ex: 10',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
          
              const SizedBox(height: 16),
          
              // Botão Adicionar
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
