import 'package:flutter/material.dart';

class ProdutoPage extends StatelessWidget {
  final String? paramNome;

  const ProdutoPage({super.key, this.paramNome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produto')),
      body: Column(children: [Text(paramNome ?? 'Param nome não foi encontrado')]),
    );
  }
}
