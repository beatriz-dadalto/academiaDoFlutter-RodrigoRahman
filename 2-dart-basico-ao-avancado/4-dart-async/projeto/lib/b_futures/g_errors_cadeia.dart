void main() {
  func1()
      .then((value) => func2())
      .then((value) => func3(), onError: (error) {
        print('Tratando erro da func2');
        //! usando esse conceito da para voltar e se recupear de um erro,
        //por exemplo: busque a valor 5 e se nao encontrar retorne o valor 7,
        //dessa forma vc se recupera de um erro. com try catch nao tem como voltar
        return func3(); // recuperar do erro
      })
      .then(print)
      .catchError((error) => print('Erro em alguma das chamadas'));
}

Future<String> func1() {
  print('func1');
  return Future.value('Fazendo algo func1');
}

Future<String> func2() {
  print('func2');
  return Future.error('Fazendo algo func2');
}

Future<String> func3() {
  print('func3');
  return Future.value('Fazendo algo func3');
}
