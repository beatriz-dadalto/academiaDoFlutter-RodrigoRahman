import 'package:flutter/material.dart';
import 'package:flutter_maonamassa/navegacao/page_two.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation: Home Page'),
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
                    settings: const RouteSettings(name: 'page2'),
                    builder: (context) => const PageTwo(),
                  ),
                );
              },
              child: const Text('Page 2 VIA página'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(PageTwo.routeName);
              },
              child: const Text('Page 2 VIA named'),
            ),
          ],
        ),
      ),
    );
  }
}
