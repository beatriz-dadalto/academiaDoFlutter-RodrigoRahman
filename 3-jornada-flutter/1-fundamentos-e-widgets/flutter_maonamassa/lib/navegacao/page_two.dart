import 'package:flutter/material.dart';
import 'package:flutter_maonamassa/navegacao/page_three.dart';

class PageTwo extends StatelessWidget {
  static const String routeName = '/page2';
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    settings: const RouteSettings(name: 'page3'),
                    builder: (context) => const PageThree(),
                  ),
                );
              },
              child: const Text('Page 3 VIA página'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/page3');
              },
              child: const Text('Page 3 VIA named'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Retirar com POP'),
            ),
          ],
        ),
      ),
    );
  }
}
