// deixar essa classe disponivel para minhas paginas atraves do Bind()
import 'package:flutter_modular_example/app/categoria/model/preco_model.dart';

class CategoriaController {
  PrecoModel precoModel;

  CategoriaController({required this.precoModel}) {
    print('Categoria Controller $hashCode');
  }
}
