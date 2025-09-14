import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing:
                MediaQuery.of(context).size.width *
                0.05, // 5% da largura da tela
            runSpacing:
                MediaQuery.of(context).size.height *
                0.02, // 2% da altura da tela
            alignment: WrapAlignment.spaceEvenly,
            children: [
              _buttonCard(
                context: context,
                onTap: () {
                  Navigator.of(context).pushNamed('/bloc/example/');
                },
                label: 'Example Bloc',
              ),
              _buttonCard(
                context: context,
                onTap: () {
                  Navigator.of(context).pushNamed('/bloc/example/freezed');
                },
                label: 'Example Freezed',
              ),
              _buttonCard(
                context: context,
                onTap: () {
                  Navigator.of(context).pushNamed('/contacts/list');
                },
                label: 'Contact',
              ),
              _buttonCard(
                context: context,
                onTap: () {
                  Navigator.of(context).pushNamed('/contacts/cubit/list');
                },
                label: 'Contact Cubit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buttonCard({
  required BuildContext context,
  required VoidCallback onTap,
  required String label,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(border: Border.all(width: 2)),
      child: Center(child: Text(label, style: TextStyle(fontSize: 32.0))),
    ),
  );
}
