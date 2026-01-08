import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/categoria/model/categoria_controller.dart';

class CategoriaPage extends StatefulWidget {
  final String? categoria;

  const CategoriaPage({super.key, this.categoria});

  @override
  State<CategoriaPage> createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categoria')),
      body: Center(
        child: Column(
          children: [
            Text(widget.categoria ?? 'Não foi enviado a categoria'),
            TextButton(
              onPressed: () {
                var controller = Modular.get<CategoriaController>();
                print('Controller hashcode: ${controller.hashCode}');
              },
              child: Text('Get Categoria Controller'),
            ),
          ],
        ),
      ),
    );
  }
}
