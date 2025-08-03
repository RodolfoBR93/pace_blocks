import 'package:flutter/material.dart';

class HomeDashboard extends StatelessWidget {
  final String userName;

  const HomeDashboard({super.key, this.userName = 'Usuário'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Olá, $userName 👋',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('🏃 Total de treinos: 0'),
                  SizedBox(height: 8),
                  Text('🔥 Calorias queimadas: 0 kcal'),
                  SizedBox(height: 8),
                  Text('⏱️ Tempo total: 0 min'),
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
              label: const Text('Começar treino'),
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
