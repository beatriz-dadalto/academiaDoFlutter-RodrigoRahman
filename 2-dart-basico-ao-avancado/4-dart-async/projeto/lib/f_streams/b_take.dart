/*
O que é?
Stream.periodic cria um Stream que emite valores em intervalos regulares
(a cada X segundos/milissegundos). É um Stream infinito que continua emitindo
valores até você cancelá-lo.

Resumo 🎯
Stream.periodic é para:

✅ Executar algo repetidamente em intervalos regulares
✅ Monitoramento em tempo real
✅ Polling (checagem periódica)
✅ Timers e cronômetros
✅ Sincronização periódica com servidor
Lembre-se:

🔴 Stream infinito por padrão
🟢 Use .take() ou break para limitar
🔵 O callback recebe um contador incremental (0, 1, 2, ...)
🟡 Perfeito para monitoramento contínuo

*/

Future<void> main() async {
  print('Início');

  // dados executados de tempos em tempos
  final interval = Duration(seconds: 2);

  var stream = Stream<int>.periodic(interval, callback);

  // Stream fica recendo dados até ser fechada
  // toodo valor que chegar vai entrar no await for
  //! Lembre-se: await for vai executar para sempre, até dizer para ela parar com take() ou break

  // vai receber ate 5 requisições e depois matar essa stream
  //! take(): valor de entrada | takeWhile() valor de saida
  stream = stream.take(5);

  await for (var i in stream) {
    print(i); // a cada 2 segs vai imprimir o novo valor
  }

  print('FIM...');
}

int callback(int value) {
  print('O valor é ${value+1}');
  return (value + 1) * 2;
}
