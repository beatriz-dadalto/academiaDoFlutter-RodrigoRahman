class Pessoa {
  late final String nome;
  late final int idade;

  void inicializar(String nome, int idade) {
    this.nome = nome;
    this.idade = idade;
  }

  void mostrarInformacoes() {
    print('Nome: $nome, Idade: $idade');
  }
}

void main() {
  final r = Pessoa();
  r.inicializar('Lord Miuxo', 18);
  r.mostrarInformacoes();
}
