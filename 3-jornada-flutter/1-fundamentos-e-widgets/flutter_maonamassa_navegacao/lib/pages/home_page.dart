import 'package:flutter/material.dart';
import 'package:flutter_maonamassa_navegacao/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(DetailPage.routeName, arguments: 'Parametro X');
              },
              child: const Text('Ir para página Detalhe por rota'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    settings: const RouteSettings(
                      name: DetailPage.routeName,
                    ),
                    builder: (_) =>
                        const DetailPage(param: 'Parâmetro pelo PageRoute'),
                  ),
                );
              },
              child: const Text('Ir para página Detalhe pelo nome da página'),
            ),
          ],
        ),
      ),
    );
  }
}
