/*
Resumo 🎯
toList() converte Stream em List:

✅ Coleta todos os valores do stream
✅ Retorna Future<List<T>>
✅ Ideal para streams finitos
✅ Permite acessar todos os valores após terminar
❌ Não use com streams infinitos (sem .take())

Use quando:

Precisa de uma lista completa
Precisa reuso de dados
Stream é pequeno/finito

Não use quando:

Stream é muito grande (usa muita memória)
Stream é infinito (sem limitação)
Pode processar sob demanda com await for

*/

Future<void> main() async {
  print('Início');

  // dados executados de tempos em tempos
  final interval = Duration(seconds: 2);

  var stream = Stream<int>.periodic(interval, callback);

  stream = stream.take(5); // Limita a 5 valores

  // quero resgatar o numeros de uma vez só. sem passar pelo loop
  // Em vez de usar await for, coleta tudo em uma lista
  //! sempre limite antes com um take
  final data = await stream.toList();

  print(data);

  print('FIM...');
}

int callback(int value) {
  print('O valor da callback é $value');
  return (value + 1) * 2;
}
