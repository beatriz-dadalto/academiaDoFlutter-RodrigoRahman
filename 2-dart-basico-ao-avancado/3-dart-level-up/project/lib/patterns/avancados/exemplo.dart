sealed class Resposta {}

class Sucesso extends Resposta {
  final String message;
  Sucesso(this.message);
}

class Erro extends Resposta {
  final String motivo;
  Erro(this.motivo);
}

class Warning extends Resposta {}

// retorna um RECORD
(String nome, int idade) obterPessoa() => ('João', 60);

// cast para processar a resposta e extrair os valores e verificar o tipo
void processarResposta(Resposta resposta) {
  switch (resposta) {
    case Sucesso(message: final mensagemSucesso):
      print('Sucesso: $mensagemSucesso');
    case Erro(:final motivo):
      print('Erro: $motivo');
    case _:
  }

  //! jeito mais comum e verboso. prefira o jeito de cima com switch
  if (resposta is Sucesso) {
    final mensagemSucesso = resposta.message;
    print(mensagemSucesso);
  } else if (resposta is Erro) {
    final erro = resposta.motivo;
    throw (erro);
  } else {
    print('warning');
  }
}

void main() {
  final (nome, idade) = obterPessoa();

  print('Pessoa: $nome, Idade $idade');
}
