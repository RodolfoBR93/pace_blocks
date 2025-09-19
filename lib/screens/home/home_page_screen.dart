import 'package:flutter/material.dart';
import 'package:pace_blocks/l10n/app_localizations.dart';
import 'package:pace_blocks/screens/create_workout/create_workout_screen.dart';
import 'package:pace_blocks/screens/home/widgets/welcome_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;

  List<Widget> get _screens => const [HomeDashboard(), CreateWorkoutScreen()];

  List<BottomNavigationBarItem> _getNavItems(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) {
      return [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
          icon: Icon(Icons.directions_run),
          label: 'Workouts',
        ),
      ];
    }
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: l10n.home),
      BottomNavigationBarItem(
        icon: Icon(Icons.directions_run),
        label: l10n.workouts,
      ),
    ];
  }

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
        items: _getNavItems(context),
      ),
    );
  }
}
