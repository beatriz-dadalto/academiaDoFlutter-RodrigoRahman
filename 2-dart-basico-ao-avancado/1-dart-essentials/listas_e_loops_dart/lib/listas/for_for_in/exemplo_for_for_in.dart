void main() {
  final listaNumero = List.generate(5, (index) => index + 1);
  print(listaNumero); // [1, 2, 3, 4, 5]

  for (var i = 0; i < listaNumero.length; i++) {
    print(listaNumero[i]);
  }
  print('---------------');
  for (final num in listaNumero) {
    print(num);
  }
  print('---------------');
  final listaBatataNormal = <String>[];
  for (final numero in listaNumero) {
    if (numero == 5) {
      listaBatataNormal.add('Batata $numero');
    }
  }

  print(listaBatataNormal);
}
