import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/categoria/model/preco_model.dart';

class ProdutoPage extends StatelessWidget {
  final String? paramNome;

  const ProdutoPage({super.key, this.paramNome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produto')),
      body: Column(
        children: [
          Text(paramNome ?? 'Param nome não foi encontrado'),
          TextButton(
            onPressed: () {
              var preco = Modular.get<PrecoModel>();
              print('Preço ${preco.hashCode}');
            },
            child: Text('Get Preço'),
          ),
        ],
      ),
    );
  }
}
