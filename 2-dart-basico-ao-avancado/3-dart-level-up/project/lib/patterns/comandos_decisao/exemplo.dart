enum TipoUsuario { admin, editor, visitante }

class PessoaComandosDecisao {
  final String nome;
  final int idade;

  PessoaComandosDecisao(this.nome, this.idade);

  void metodoQualquer() {
    print('Ola, Mundo!');
  }

  @override
  String toString() {
    return 'Pessoa(nome: $nome, idade: $idade)';
  }
}

// verificação com DESTRUCTURING
void switchComEnum(TipoUsuario tipo) {
  switch (tipo) {
    case TipoUsuario.admin:
      break;
    case TipoUsuario.editor:
      break;
    case _:
  }
}

void ifCaseComClasse(final PessoaComandosDecisao pessoa) {
  switch (pessoa) {
    // se o nome for Beatriz, guarde na var idade
    case PessoaComandosDecisao(nome: 'Beatriz', idade: var idade):
      print('Olá, Beatriz Dadalto! Você tem $idade anos?');
      break;
    // default
    case PessoaComandosDecisao(:final nome, :final idade):
      print('Olá $nome, você tem $idade anos?');
      break;
  }

  //! if case valida um Pattern. if normal valida apenas true ou false!
  if (pessoa case PessoaComandosDecisao(nome: 'Beatriz', idade: var idade)) {
    print('Olá, Beatriz Dadalto! Você tem $idade anos?');
  } else {
    final PessoaComandosDecisao(:nome, :idade) = pessoa;
    print('Olá $nome, você tem $idade anos?');
  }
}

// verificação com PATTERN
void switchIfCaseListas(List<int> numeros) {
  switch (numeros) {
    case [1, 2, 3]:
      print('A lista contem os elementos 1, 2 e 3.');
      break;
    case [1, 2, 3, ..., 99]:
      print('A lista contem 1,2,3 nos primeiros elementos e 99 no ultimo');
      break;
    case [1, 2, 3, ...]:
      print('A lista contem 1,2,3 como primeiros elementos');
      break;
  }

  if (numeros case [int primeiro, ...var meio, 99]) {
    print('__A lista contem $primeiro, o meio é $meio e 99 no último');
  } else {
    print('Não achou MATCH no if-case');
  }
}

void main() {
  switchIfCaseListas([1, 2, 3]); // A lista contem os elementos 1, 2 e 3.
  // switchIfCaseListas([4, 5, 6]); // mostra nada porque nao foi tratado
  // switchIfCaseListas([
  //   1,
  //   2,
  //   3,
  //   4,
  // ]); // A lista contem 1,2,3 como primeiros elementos
  // switchIfCaseListas([
  //   1,
  //   2,
  //   3,
  //   4,
  //   99,
  // ]); // A lista contem 1,2,3 nos primeiros elementos e 99 no ultimo
}
