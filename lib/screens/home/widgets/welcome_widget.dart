import 'package:flutter/material.dart';
import 'package:pace_blocks/l10n/app_localizations.dart';

class HomeDashboard extends StatelessWidget {
  final String userName;

  const HomeDashboard({super.key, this.userName = ''});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    final displayName = userName.isEmpty ? l10n.user : userName;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.helloUser(displayName),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.totalWorkouts(0)),
                  const SizedBox(height: 8),
                  Text(l10n.caloriesBurned(0)),
                  const SizedBox(height: 8),
                  Text(l10n.totalTime(0)),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // Navegar ou iniciar treino
              },
              icon: const Icon(Icons.play_arrow),
              label: Text(l10n.startWorkout),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
