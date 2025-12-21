void main() {
  // exercicio: inverta os valores das variaveis.

  // destructuring recebe os valores de um record nomeado
  var (:a, :b) = (a: 10, b: 20);

  print('a: $a, b: $b');

  // invertendo os valores
  (a, b) = (b, a);

  print('a: $a, b: $b');
}
