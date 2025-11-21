void main() {
  var listaVazia = List<String>.empty();
  var listaGerada = List.generate(4, (i) => 'Batata $i');
  var listaFill = List.filled(3, 'Banana');

  print(listaGerada); // [Batata 0, Batata 1, Batata 2, Batata 3]
  print(listaFill); // [Banana, Banana, Banana]
}
