import 'dart:collection';

void main() {
  // lista simples
  final listaSimples = [1, 2, 3, 4, 5];

  // filled list
  final listaImutavel = List.filled(10, '');
  //listaImutavel.add('1'); // ERRO porque nao da para add nem remove
  print(listaImutavel);

  // filled vira lista simples dessa forma
  final listaMutavel = List.filled(10, '', growable: true);
  listaMutavel.add('1');

  final numeroImutavel = UnmodifiableListView(listaSimples);
  print(numeroImutavel);
}
