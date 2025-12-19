import 'package:oop_dart/extensions/methods/string_extension.dart';

void main() {
  final nome = 'Beatriz Dadalto';
  nome.saudacao();

  'Lord Miuxo'.teste();

  print('rock and roll'.capitalizar());
}

class PessoaTrabalhadora {
  String nome;

  PessoaTrabalhadora(this.nome);

  String recuperarNome() => nome;
}
