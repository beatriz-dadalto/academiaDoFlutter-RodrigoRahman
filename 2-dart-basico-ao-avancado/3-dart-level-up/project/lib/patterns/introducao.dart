void main() {
  final lista = <dynamic>[1, '2'];

  if (lista case [int primeiro, int segundo, int terceiro, ...]) {
    print('Os três primeiros params são int [$primeiro, $segundo, $terceiro]');
  } else {
    print('Desculpe mas um dos três params não são int');
  }
}
