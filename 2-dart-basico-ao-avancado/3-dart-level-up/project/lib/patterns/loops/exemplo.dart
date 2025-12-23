void main() {
  //! destructuring na condição for

  // lista
  final listaPessoas = [
    ['Lord', 18],
    ['Cometa', 22],
  ];

  for (final [nome, idade] in listaPessoas) {
    print('Nome: $nome, idade: $idade');
  }

  // map
  final mapaProdutos = {'Arroz': 5.99, 'Feijão': 7.49};

  for (final MapEntry(:key, :value) in mapaProdutos.entries) {
    print('$key -> $value');
  }

  // record
  final recordProducts = [
    (produto: 'Soja', preco: 10.75),
    (produto: 'Gongorzola', preco: 18.20),
  ];

  for (final (produto: String produto, preco: double preco) in recordProducts) {
    print('$produto = $preco');
  }
}
