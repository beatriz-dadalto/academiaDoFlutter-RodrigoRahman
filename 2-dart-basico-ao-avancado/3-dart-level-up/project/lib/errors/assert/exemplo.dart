void verificarIdade(int idade) {
  assert(idade >= 18, 'Idade deve ser maior ou igual a 18');
}

void main() {
  // verificarIdade(10);

  UsuarioAssert('Beatriz', -1);
}

class UsuarioAssert {
  final String nome;
  final int idade;
  UsuarioAssert(this.nome, this.idade)
    : assert(nome.isNotEmpty, 'O nome não pode ser vazio'),
      assert(idade > 0, 'A idade deve ser maior que zero');
}
