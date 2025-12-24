void main() {
  // print('Levando o carro para o mecânico');

  // Future<int>(() {
  //   // função assincrona que vai fazer o orçamento da manutenção do carro
  //   return 10 ~/ 2;
  // }).then((valorOrcamento) {
  //   print('O orçamento para arrumar o carro é de $valorOrcamento');
  // });

  // print('Saindo da oficina mecanica');

  // print('---------------');

  // print('FUI VIAJAR');
  // Future<String>(() {
  //       // indo para USA
  //       throw Exception('Avião caiu');
  //       return 'Macbook Comprado';
  //     })
  //     .then((comprado) {
  //       print('comprei meu macbook');
  //     })
  //     .catchError((error) {
  //       print('Deu RUIM, o avião caiu');
  //     })
  //     .whenComplete(() => print('Finalizando a viagem'));

  // print('Macbook no Brasil');

  print('---------------');

  Future<int>(() {
        return 10 ~/ 0;
      })
      .then((value) => print('Valor calculado é $value'))
      .catchError((error) {
        print('Ocorreu um erro no catchError1 $error');
      }, test: (error) => error is UnsupportedError)
      .catchError((error) {
        print('ocorreu um erro no catchError2 $error');
      });
}
