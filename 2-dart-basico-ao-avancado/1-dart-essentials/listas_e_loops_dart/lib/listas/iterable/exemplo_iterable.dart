void main() {
  final listaNumero = List.generate(5, (i) => i + 1);
  print(listaNumero); // [1, 2, 3, 4, 5]

  final listaBatatas = listaNumero.map((numero) => 'Batata $numero');
  print(listaBatatas.elementAt(4)); // Batata 5

  final listaBananas = listaNumero
      .where((numero) => numero != 2)
      .map((numero) => 'Banana $numero')
      .toList();
  print(listaBananas); // [Banana 1, Banana 3, Banana 4, Banana 5]
}
