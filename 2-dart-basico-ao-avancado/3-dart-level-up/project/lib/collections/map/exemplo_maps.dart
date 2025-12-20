void main() {
  final estoque = <String, int>{'Maçã': 10, 'Banana': 20, 'Batata': 30};

  final estoqueDeBatata = estoque['Batata'];
  print('EstoqueDeBatata: $estoqueDeBatata');

  // adicionar
  estoque['Laranja'] = 40;

  estoque.addAll({'Abacaxi': 35});

  print(estoque);

  // adicionar se não existir
  estoque.putIfAbsent('Morango', () => 100);

  print(estoque);

  print('Iterar por chave:');
  for (String chave in estoque.keys) {
    print(chave);
  }

  print('Iterar por valor:');
  for (int valor in estoque.values) {
    print(valor);
  }

  // ENTRIES: mostra a chave e o valor
  print('Iterar por entries:');
  for (MapEntry<String, int> entrada in estoque.entries) {
    print('Chave: ${entrada.key} (${entrada.value})');
  }

  // ENTRIES: mostra a chave e o valor COM DESTRUTURAÇÃO
  print('Iterar por entries COM DESTRUTURAÇÃO:');
  for (final MapEntry(:key, :value) in estoque.entries) {
    print('Chave: $key ($value)');
  }
}
