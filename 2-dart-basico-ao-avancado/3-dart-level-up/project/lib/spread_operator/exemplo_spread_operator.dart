void main() {
  final lista1 = List.generate(5, (index) => index);
  final lista2 = List.generate(5, (index) => index + 5);

  print(lista1);
  print(lista2);

  final listaCompleta = [];

  listaCompleta.addAll(lista1);
  listaCompleta.addAll(lista2);
  print('ListaCompleta: $listaCompleta');

  // com spread operator
  final listaSpreadOperator = [25, ...lista1, 500, 600, ...lista2];
  print('ListaSpreadOperator: $listaSpreadOperator');
}
