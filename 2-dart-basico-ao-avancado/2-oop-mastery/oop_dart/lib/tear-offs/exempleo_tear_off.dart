/*
O que é um "tear-off" (em poucas palavras):

Um tear-off em Dart é quando você pega uma função ou método e o trata como um
objeto (uma função de primeira classe) sem chamá‑lo — ou seja, você remove os
parênteses e obtém uma referência à função. Essa referência pode ser armazenada,
passada como argumento ou retornada.

Tear-offs são uma forma concisa de obter referências a funções/métodos/constructors
para passar como valores. Use quando melhora clareza e reduz boilerplate
— evite quando torna o fluxo menos explícito.
*/

class Pessoa {
  final String nome;

  Pessoa(this.nome);

  @override
  String toString() => 'Pessoa: $nome';
}

void criarEExibirPessoa(
  final String nome,
  final Pessoa Function(String) criador,
) {
  final pessoa = criador(nome);
  print(pessoa);
}

Pessoa criarPessoa(final String nome) => Pessoa(nome);

void main() {
  criarEExibirPessoa('Beatriz', criarPessoa);
  criarEExibirPessoa('Beatriz Função Anônima', (String nome) => Pessoa(nome));
  // inves de criar um funcao como a criarPessoa ou uma funcao anonima uso o tear-off Pessoa.new
  criarEExibirPessoa('Beatriz Tear-off', Pessoa.new);
}
