/*
O que é?
listen() subscreve a um Stream e reage a cada valor emitido, sem bloquear a
execução. É como .then() do Future, mas para Streams

Resumo 🎯
listen() é para:

✅ Reagir a valores sem bloquear execução
✅ Monitoramento em tempo real
✅ Múltiplos streams simultâneos
✅ Operações em background
✅ Controle fino (pause, resume, cancel)
Use quando:

Precisa de não-bloqueante
Múltiplos streams ao mesmo tempo
Operações em background
Precisa pausar/cancelar dinamicamente
Não use quando:

Precisa processar valores em sequência (use await for)
Precisa de todos os valores de uma vez (use toList())
Analogia:

await for = Ficar olhando para chegada de ônibus (bloqueia)
listen() = Registrar notificação de chegada (continua fazendo outras coisas)

*/

Future<void> main() async {
  print('Início');

  // dados executados de tempos em tempos
  final interval = Duration(seconds: 2);

  var stream = Stream<int>.periodic(interval, callback);

  stream = stream.take(10); // Limita a 10 valores

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
