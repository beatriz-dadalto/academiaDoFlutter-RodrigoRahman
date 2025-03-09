import 'package:flutter/material.dart';
import 'package:flutter_maonamassa/navegacao_params/details.dart';

class Listy extends StatelessWidget {
  const Listy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    settings: const RouteSettings(name: 'detalhe', arguments: {
                      'id': 10,
                    }),
                    builder: (context) => const Details(),
                  ),
                );
              },
              child: const Text('Detalhes com PUSH para página'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/details', arguments: {'id': 20});
              },
              child: const Text('Detalhes com NAMED para rota'),
            ),
          ],
        ),
      ),
    );
  }
}
