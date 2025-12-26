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

  //! take(): valor de entrada | skip() pula 3 primeiras entradas
  /*
  skip(n): Ignora/pula os N primeiros valores e começa a emitir a partir do (N+1)ésimo.
  Quando usar:
  - Ignorar os primeiros N valores
  - Exemplo: Pular header de arquivo, ignorar primeiras mensagens de teste
  */
  stream = stream.take(5).skip(2);

  /*
  skipWhile(condition): Ignora valores enquanto a condição for verdadeira.
  Quando a condição fica falsa, começa a emitir a partir daquele ponto.
  Quando usar:
  - Ignorar valores enquanto uma condição for verdadeira
  - Exemplo: Ignorar logs de inicialização, começar a processar quando pronto
  */
  stream = stream.take(5).skipWhile((numero) {
    print('Numero que chegou na skipWhile $numero');
    return numero < 5; // ignora quem é menor que 5
  });

  await for (var i in stream) {
    print(i); // a cada 2 segs vai imprimir o novo valor
  }

  print('FIM...');
}

int callback(int value) {
  print('O valor da callback é $value');
  return (value + 1) * 2;
}
