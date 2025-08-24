import 'package:flutter/material.dart';
import 'package:flutter_default_state_manager/setState/imc_set_state_page.dart';
import 'package:flutter_default_state_manager/value_notifier/value_notifer_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _goToPage(context, ImcSetStatePage()),
              child: Text('setState'),
            ),
            ElevatedButton(
              onPressed: () => _goToPage(context, ValueNotiferPage()),
              child: Text('valueNotifier'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('changeNotifier'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Bloc Pattern (Streams)'),
            ),
          ],
        ),
      ),
    );
  }
}
