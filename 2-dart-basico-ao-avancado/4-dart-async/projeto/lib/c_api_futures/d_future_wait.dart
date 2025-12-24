/*

Future.wait() aguarda múltiplas futures completarem e retorna uma lista com
toodos os resultados. É perfeito quando você precisa executar várias operações
assíncronas em paralelo e esperar todas terminarem.

Características:
- Executa múltiplas futures em paralelo (não sequencialmente)
- Aguarda a última future terminar
- Retorna lista com todos os resultados na ordem original
- Se uma falhar, lança erro (a menos que use eagerError: false)

Resumo: Future.wait() é para paralelização - executa tudo ao mesmo tempo e
aguarda o término, economizando tempo!

*/


void main() {
  print('Init main');

  var f1 = Future.delayed(Duration(seconds: 1), () => 'F1');
  var f2 = Future.delayed(Duration(seconds: 1), () => 'F2');
  var f3 = Future.delayed(Duration(seconds: 2), () => 'F3');
  var f4 = Future.delayed(Duration(seconds: 1), () => 'F4');
  var f5 = Future.delayed(
    Duration(seconds: 1),
    () => Future.error('Erro na execucao'),
  );

  // o wait vai esperar o ultimo terminar. se algo retornar um erro,
  // ele espera mesmo assim o ultimo terminar
  Future.wait([f1, f2, f3, f4, f5])
      .then((arrayValues) {
        print(arrayValues[0]);
        print(arrayValues[1]);
        print(arrayValues[2]);
        print(arrayValues[3]);
        print(arrayValues[4]);
        print(arrayValues);
      })
      .catchError((error) {
        print(error);
      });

  print('End Main');

}
