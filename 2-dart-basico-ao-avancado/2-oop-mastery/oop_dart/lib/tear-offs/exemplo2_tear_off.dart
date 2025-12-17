class Pessoa {
  final String nome;

  Pessoa(this.nome);
  Pessoa.comNome(this.nome);
  factory Pessoa.fabrica(final String nome) => Pessoa(nome);
  Pessoa.redirect(final String nome) : this(nome);
  const Pessoa.constante(this.nome);
}

void main() {
  final padrao = Pessoa.new;
  final nomeado = Pessoa.comNome;
  final fabrica = Pessoa.fabrica;
  final redirecionado = Pessoa.redirect;
  //!constante não pode. nunca serao definidos em tempo de compilacao
  //final constante = const Pessoa.constante;
}
