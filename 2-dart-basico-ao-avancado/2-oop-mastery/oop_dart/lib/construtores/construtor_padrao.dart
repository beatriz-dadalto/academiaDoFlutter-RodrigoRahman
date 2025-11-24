class Usuario {
  String nome;
  int? idade;

  Usuario(this.nome, [this.idade]);
}

class Pessoa {
  String nome;
  int idade;

  Pessoa({required this.nome, required this.idade});
}

void main() {
  final usuario = Usuario('Lord Miuxo', 3);
  final p = Pessoa(nome: 'Anny', idade: 35);
}
