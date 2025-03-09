import 'package:flutter/material.dart';
import 'package:flutter_maonamassa/navegacao/page_four.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    settings: const RouteSettings(name: 'page4'),
                    builder: (context) => const PageFour(),
                  ),
                );
              },
              child: const Text('Page 4 VIA PushReplacement'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Page 4 VIA named'),
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
