class Cliente {
  String nome;
  int idade;
  String? email;

  Cliente(this.nome, this.idade, this.email);

  Cliente.menorIdade(String nome) : this(nome, 17, null);
}
