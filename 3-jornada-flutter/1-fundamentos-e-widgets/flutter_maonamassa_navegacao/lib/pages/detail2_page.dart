import 'package:flutter/material.dart';

class Detail2Page extends StatelessWidget {
  static const routeName = '/detail2';

  const Detail2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe 2'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop('Parâmetro retornado pela tela Detail2Page');
          },
          child: const Text('Voltar'),
        ),
      ),
    );
  }
}
