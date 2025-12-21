// match busca um condicao verdadeira
void matching() {
  dynamic a = 10;

  if (a case int n) { //! nesse linha é um PATTERN
    // aqui é que deu MATCH
  }
}

// destructuring = extração
void destructuring() {
  final lista = [1, 2, 3, 4, 5];

  // toodos elementos de uma lista devem ser destruturados senão da ERRO
  // pega os 3 elementos
  final [a, b, c, _] = lista;

  var record = (nome: 'Beatriz', idade: 18);

  var (nome: nome, idade: idade) = record;

  var recordPosicional = ('Beatriz', 18);
  var (n, i) = recordPosicional;
}
