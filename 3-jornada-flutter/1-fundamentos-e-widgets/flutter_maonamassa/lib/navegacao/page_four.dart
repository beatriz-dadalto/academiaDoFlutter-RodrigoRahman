import 'package:flutter/material.dart';
import 'package:flutter_maonamassa/navegacao/page_one.dart';
import 'package:flutter_maonamassa/navegacao/page_two.dart';

class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 4'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    settings: const RouteSettings(name: 'page1'),
                    builder: (context) => const PageOne(),
                  ),
                  // ModalRoute.withName('page2'),
                  (route) => route.isFirst,
                );
              },
              child: const Text('Voltar para Page 1 | PushAndRemoveUntil'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Remover da pilha com POP'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    settings: const RouteSettings(name: '/page1'),
                    builder: (context) => const PageOne(),
                  ),
                  ModalRoute.withName(PageTwo.routeName),
                );
              },
              child: const Text('Limpar todas da pilha | PushAndRemoveUntil'),
            ),
          ],
        ),
      ),
    );
  }
}
