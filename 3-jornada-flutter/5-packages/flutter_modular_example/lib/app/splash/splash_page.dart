import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Splash')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                //! recebe o param pelo Modular.args.data
                Modular.to.pushNamed('/categoria', arguments: 'categoria selecionada @@@@');
              },
              child: Text('Categoria Module'),
            ),
            TextButton(
              onPressed: () {
                //! recebe o param pelo Modular.args.params
                Modular.to.pushNamed('/produto/produto_X/xyz');
              },
              child: Text('Produto Module'),
            ),
            TextButton(
              onPressed: () {
                Modular.to.pushNamed('/categoria/produto/categoria_produto_X/xyz');
              },
              child: Text('Produto dentro de CATEGORIA Module'),
            ),
            TextButton(
              onPressed: () {
                //! recebe o param pelo Modular.args.queryParams
                Modular.to.pushNamed('/produto/xyz?paramNome=produto2_X');
              },
              child: Text('Produto2 Query Param'),
            ),
          ],
        ),
      ),
    );
  }
}
