import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pace_blocks/data/database/populate_initial_data.dart';
import 'package:pace_blocks/screens/home/home_page_screen.dart';
import 'package:pace_blocks/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await populateInitialData();
  runApp(const PaceBlocks());
}

class PaceBlocks extends StatelessWidget {
  const PaceBlocks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pace Blocks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('pt', ''), // Portuguese
      ],
      home: const HomePageScreen(),
    );
  }
}
