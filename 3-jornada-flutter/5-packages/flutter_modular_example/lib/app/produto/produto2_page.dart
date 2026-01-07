import 'package:flutter/material.dart';

class Produto2Page extends StatelessWidget {
  final String? paramNome;

  const Produto2Page({super.key, this.paramNome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produto')),
      body: Column(children: [Text(paramNome ?? 'Param nome não foi encontrado')]),
    );
  }
}
