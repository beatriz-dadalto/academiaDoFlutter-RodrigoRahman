import 'dart:async';

Future<void> main() async {
  print('Inicio streamController');

  final streamController = StreamController<PessoaStream>.broadcast();

  // para entrada
  final inStream = streamController.sink;
  // para saída
  final outStream = streamController.stream;

  outStream
      .listen((pessoa) {
        print('Seja bem vindo(a) ${pessoa.nome}');
      });

  var numeros = List.generate(20, (index) => index);

  for (var numero in numeros) {
    print('Enviando numero $numero');
    inStream.add(PessoaStream(nome: 'beatriz Dadalto $numero'));
    await Future.delayed(Duration(milliseconds: 500));
  }

  print('FIM streamController');

  // fechei a paorta. nada mais entrada
  await streamController.close();
}

class PessoaStream {
  String nome;
  PessoaStream({
    required this.nome,
  });
}
