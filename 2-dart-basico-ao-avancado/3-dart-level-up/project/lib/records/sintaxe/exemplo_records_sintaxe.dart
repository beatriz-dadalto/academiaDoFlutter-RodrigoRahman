void recordPosicional() {
  var ponto = (10, 10, 'João');
  print('Ponto: ${ponto.$1}, ${ponto.$2}, ${ponto.$3}');

  // destructuring
  final (posicao1, posicao2, posicao3) = ponto;
  print('Destructuring: $posicao1, $posicao1, $posicao1');
}

void recordNomeado() {
  final ponto = (
    name: 'Beatriz Dadalto',
    idade: 98,
    curso: 'Academia do Flutter',
  );

  print('Ponto: ${ponto.name}, ${ponto.idade}, ${ponto.curso}');

  // destructuring: pode ser em ordem diferente
  final (:curso, :name, :idade) = ponto;

  print('$curso, $name, $idade');
}

// paremetros posicionais e nomeados, mas vira uma bagunça.
//! Não utilizar dessa forma
void recordMisto() {
  final ponto = ('Beatriz Dadalto', idade: 98, curso: 'Academia do Flutter');

  final (posicao1, :idade, :curso) = ponto;

  print('Misto: $posicao1, $idade, $curso');
}

// pode declarar os tipos (record anonimo)
// escreva entre parenteses para ser identificado como record
(String, int) retorno() {
  return ('', 10);
}
