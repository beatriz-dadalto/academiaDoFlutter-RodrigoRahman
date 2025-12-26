import 'dart:async';

Future<void> main() async {
  print('Inicio streamController');

  final streamController = StreamController<int>.broadcast();

  // para entrada
  final inStream = streamController.sink;
  // para saída
  final outStream = streamController.stream;

  outStream
      .skip(1)
      .where((numero) => numero % 2 == 0)
      .map((numero) => 'O valor par enviado é $numero')
      .listen((strConvertida) {
        print('String recebida');
        print(strConvertida);
      });

  var numeros = List.generate(20, (index) => index);

  for (var numero in numeros) {
    print('Enviando numero $numero');
    inStream.add(numero);
    await Future.delayed(Duration(milliseconds: 500));
  }

  print('FIM streamController');

  // fechei a paorta. nada mais entrada
  await streamController.close();
}
