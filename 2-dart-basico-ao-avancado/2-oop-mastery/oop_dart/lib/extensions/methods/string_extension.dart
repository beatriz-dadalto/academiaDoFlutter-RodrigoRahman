import 'package:oop_dart/extensions/methods/exemplo_extensions_methods.dart';

extension SaudacaoExtensions on String {
  void saudacao() {
    print('Olá $this, Bem vindo(a) a Academia do Flutter');
  }

  void teste() {
    print('Teste saudação, $this');
  }
}

extension PessoaExtension on PessoaTrabalhadora {
  void saudacao2() {
    print('Olá, ${recuperarNome()}, Diga: Hello, World!');
  }
}

extension CapitalizeExtension on String {
  String capitalizar() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
