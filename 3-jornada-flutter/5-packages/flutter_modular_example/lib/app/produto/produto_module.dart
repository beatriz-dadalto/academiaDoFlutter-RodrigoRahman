import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/categoria/categoria_module.dart';
import 'package:flutter_modular_example/app/produto/produto_page.dart';

class ProdutoModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [
    CategoriaModule(),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      //! param obrigatorio
      '/:paramNome/xyz',
      child: (context, args) => ProdutoPage(paramNome: args.params['paramNome']),
    ),
    ChildRoute(
      //! param opcional, query param
      '/xyz',
      child: (context, args) => ProdutoPage(paramNome: args.queryParams['paramNome']),
    ),
  ];
}
