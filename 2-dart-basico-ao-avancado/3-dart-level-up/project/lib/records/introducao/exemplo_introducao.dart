/*
  1. Record só é possível utilizar a partir do Dart 3
  2. Record é um agregador: pode usar vários tipos ao mesmo tempo
  3. é anonimo: (double, double)
  4. Record é imutavel
*/

(double, double) obterCoordenadasRecord() {
  return (20, -20);
}

void main() {
  final (latitude, longitude) = obterCoordenadasRecord();

  print(latitude);
  print(longitude);

  // record é um agregador: vários tipos
  final pessoa = ('joão', 43, true, 43.0, (10, -10));

  // anônimo
  final mapaX = {'valor': "1"};
  mapaX['valor'] = "2";

  // imutável: não pode alterar o valor depois de inicializado
  pessoa.$2;
}
