import 'dart:async';

/*
StreamController é uma forma de criar e controlar manualmente um
stream (fluxo de dados). Ele funciona como um gerenciador que:

1. Recebe dados (entrada) através do sink. Pense no sink como um funil onde você coloca dados.
2. Envia dados (saída) através do stream. O stream é a porta de saída do stream.
É por onde os dados fluem para os listeners

O .broadcast() permite que múltiplos listeners escutem o mesmo stream.
Sem isso, apenas um listener seria permitido.

listen() (Escuta)
listen() é o método que ativa a escuta do stream. Sem ele,
os dados fluem mas ninguém os processa.

*/


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
    inStream.add(numero); //! Envia um número para o stream
    await Future.delayed(Duration(milliseconds: 500));
  }

  print('FIM streamController');

  // fechei a paorta. nada mais entrada
  await streamController.close();
}
