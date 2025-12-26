/*


*/

Future<void> main() async {
  print('Início');

  // dados executados de tempos em tempos
  final interval = Duration(seconds: 2);

  var stream = Stream<int>.periodic(interval, callback);

  // 3 resultados de divisão por 6 com resto zero
  // use o where para filrar
  // use o skipWhile para descartar
  stream = stream.where((numero) => numero % 6 == 0).take(3);

  // nao espera como o await for. listen funciona como o then()
  stream.listen((numero) {
    print('Listen value: $numero');
  });

  print('FIM...');
}

int callback(int value) {
  print('O valor da callback é $value');
  return (value + 1) * 2;
}
