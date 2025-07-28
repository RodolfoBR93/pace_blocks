import 'package:flutter/material.dart';
import 'package:pace_blocks/screens/create_workout/create_workout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const CreateWorkout(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return WorkoutScheduleScreen();
  }
}

class NoOverscrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
class WorkoutScheduleScreen extends StatelessWidget {
  const WorkoutScheduleScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treino Intervalado - Semana 1'),
        backgroundColor: Colors.teal,
      ),
  body: ScrollConfiguration(
    behavior: NoOverscrollBehavior(),
    child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildDayCard(
              context,
              day: 'Segunda-feira',
              sessions: [
                '1x 45 Corrida Leve (CL)',
              ],
            ),
            _buildDayCard(
              context,
              day: 'Terça-feira',
              sessions: [
                '1x 10 Corrida Leve (CL)',
                '2x 5 Corrida Moderada (CM)',
                '2x 3 Corrida Forte (CF)',
                'Recuperação 1 Corrida Leve entre séries'
              ],
            ),
            _buildDayCard(
              context,
              day: 'Quarta-feira',
              sessions: [
                '1x 45 Caminhada (CA)',
              ],
            ),
            _buildDayCard(
              context,
              day: 'Quinta-feira',
              sessions: [
                '1x 10 Corrida Leve (CL)',
                '2x 8 Corrida Moderada (CM)',
                '2x 2 Corrida Forte (CF)',
                'Recuperação 1 Corrida Leve entre séries'
              ],
            ),
            _buildDayCard(
              context,
              day: 'Sexta-feira',
              sessions: [
                '1x 45 Caminhada Leve (CA-L)',
              ],
            ),
            _buildDayCard(
              context,
              day: 'Sábado',
              sessions: [
                '1x 10 Corrida Leve (CL)',
                '1x 12 Corrida Moderada (CM)',
                '1x 6 Corrida Forte (CF)',
                'Recuperação 1 Corrida Leve entre séries'
              ],
            ),
            _buildDayCard(
              context,
              day: 'Domingo',
              sessions: [
                'Descanso'
              ],
            ),
          ],
        ),
  ),    

    );
}

  Widget _buildDayCard(BuildContext context, {
    required String day,
    required List<String> sessions,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            for (final session in sessions)
              Row(
                children: [
                  const Icon(Icons.fitness_center, size: 16, color: Colors.teal),
                  const SizedBox(width: 8),
                  Expanded(child: Text(session)),
                ],
              )
          ],
        ),
      ),
    );
  }
}
