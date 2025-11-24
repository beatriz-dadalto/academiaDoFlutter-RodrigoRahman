class Pessoa {
  static const String nome = 'Beatriz';
  int? idade;

  static void x() {
    print('x');
  }
}

void main() {
  Pessoa.nome;
  Pessoa.x();

  final pessoa = Pessoa();
  pessoa.idade;
}
