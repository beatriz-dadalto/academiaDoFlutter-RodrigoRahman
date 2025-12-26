import 'dart:async';

Future<void> main() async {
  final aguardando = inserindoAlgoBemLento();

  print(DateTime.now().toIso8601String());

  // tempo de execução que quero aguardar caso nao termine em 1 seg quero
  // ser informada com o .catchError()
  // termina no erro, nao cancela o futuro porque depois que entra no event loop
  // nao é possivel cancela-la. então nesse exemplo iria informar o timeout, mas
  // no fim o insert aconteceria porque o future nao é cancelado.
  //! timeout apenas informa, ele nao cancela o Future do event loop
  // aguardando
  //     .timeout(
  //       Duration(seconds: 1),
  //       onTimeout: () {
  //         print('Terminou com timeout');
  //       },
  //     )
  //     .then((value) {
  //       print('terminou a execução');
  //     })
  //     .catchError((error) {
  //       print('Terminou com erro: $error');
  //     });

  print('----COM ASYNC AWAIT - TRATANDO COM TRY CATCH----');

  try {
    final aguardando = await inserindoAlgoBemLento().timeout(
      Duration(seconds: 1),
    );
  } on TimeoutException catch (e, s) {
    print('Finalizou com timeout $e');
    print(s);
  }
}

Future<void> inserindoAlgoBemLento() {
  return Future.delayed(Duration(seconds: 3), () {
    print('Terminou o insert');
    print(DateTime.now().toIso8601String());
  });
}
