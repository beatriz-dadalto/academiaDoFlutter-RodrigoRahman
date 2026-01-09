import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/categoria/categoria_page.dart';
import 'package:flutter_modular_example/app/categoria/model/categoria_controller.dart';
import 'package:flutter_modular_example/app/categoria/model/preco_model.dart';
import 'package:flutter_modular_example/app/categoria/model/x.dart';
import 'package:flutter_modular_example/app/produto/produto_module.dart';

class CategoriaModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    /*
      isLazy: false -> logo que carregar o modulo cria a instancia
      isLazy: true -> é padrão
      isSingleton: true é padrão
      isSingleton: false -> criar uma instancia nova toda vez que recarregar
      !i -> significa inject. i.get() ou apenas i() porque é uma callable class.
      !A callable class is a class that implements the call() method, allowing instances of that class to be invoked like functions.
      Bind.factory -> Always a new constructor when calling Modular.get
      Bind.singleton -> Built together with the module. The instance will always be the same.
      Bind.lazySingleton -> Built only when called the first time
      using Modular.get. The instance will always be the same.
    */
    //Bind((i) => CategoriaController(), isLazy: true, isSingleton: true),
    //! export: exporta apenas o PrecoModel() para quem está chamando no ProdutoModule. Quando uma classe depende de outra como no exemplo de PrecoModel e X também precisa do export
    Bind.lazySingleton((i) => PrecoModel(x: i<X>()), export: true),
    Bind.lazySingleton((i) => X(), export: true),
    Bind.singleton((i) => CategoriaController(precoModel: i<PrecoModel>())),
    //Bind.factory((i) => CategoriaController(),),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => CategoriaPage(categoria: args.data),
    ),
    ModuleRoute('/produto', module: ProdutoModule()),
  ];
}
