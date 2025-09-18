import 'package:flutter/material.dart';
import 'package:pace_blocks/data/database/populate_initial_data.dart';
import 'package:pace_blocks/screens/home/home_page_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await populateInitialData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePageScreen(),
    );
  }
}
