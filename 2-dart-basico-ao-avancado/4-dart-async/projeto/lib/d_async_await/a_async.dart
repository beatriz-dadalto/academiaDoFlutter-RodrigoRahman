void main() {
  //! Event Loop = Processa: Call Stack → Microtask Queue → Event Queue → repete
  /*
  Código síncrono = Call Stack (executa primeiro)
  Funções async = Executam até o primeiro await de forma síncrona, depois os
  callbacks vão para microtask .then(), .whenComplete() = Microtask Queue
  (executam quando call stack está vazio)
  */
  print('Init main');

  final nome = metodoAssincronoSemAsync();
  final nome2 = metodoAssincrono();

  nome2.then(print); // Beatriz Dadalto

  nome.then(print).catchError(print); // Bia, metodoAssincronoSemAsync

  metodoAssincronoVoid().whenComplete(() => print('Finalizou o metodo void'));

  print('End main');
}

Future<String> metodoAssincronoSemAsync() {
  return Future.value('Bia, metodoAssincronoSemAsync');
}

// usando o async o dart envelopa em um Future.value()
Future<String> metodoAssincrono() async {
  return 'Beatriz Dadalto';
}

Future<void> metodoAssincronoVoid() async {
  print('metodo void');
}
