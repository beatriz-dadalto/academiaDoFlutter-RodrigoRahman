import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail';

  final String param;

  const DetailPage({super.key, required this.param});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Text(param),
      ),
    );
  }
}
