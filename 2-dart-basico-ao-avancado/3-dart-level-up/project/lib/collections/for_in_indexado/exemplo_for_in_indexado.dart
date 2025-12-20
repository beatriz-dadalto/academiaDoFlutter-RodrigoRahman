void main() {
  final numeros = List.generate(3, (index) => index);

  print('For In indexado');
  for (final (indice, valor) in numeros.indexed) {
    print('Indice: $indice ($valor)');
  }

  print('For In simples');
  var i = 0;
  for (final n in numeros) {
    print('Indice: $i ($n)');
    i++;
  }
}
