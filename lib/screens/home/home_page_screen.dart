import 'package:flutter/material.dart';
import 'package:pace_blocks/screens/create_workout/create_workout_screen.dart';
import 'package:pace_blocks/screens/home/widgets/welcome_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;
  static const String _homeLabel = 'Home';
  static const String _workoutLabel = 'Treinos';

  List<Widget> get _screens => const [HomeDashboard(), CreateWorkoutScreen()];

  static const List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: _homeLabel),
    BottomNavigationBarItem(
      icon: Icon(Icons.directions_run),
      label: _workoutLabel,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
        items: _navItems,
      ),
    );
  }
}
