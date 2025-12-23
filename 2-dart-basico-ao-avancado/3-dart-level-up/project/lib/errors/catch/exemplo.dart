/*

Duas classes para erros:

1. Exceptions: são erros tratáveis ou controlados pelo próprio desenvolvedor
(erro de regra de negocio, usuário inválido, tentativa de acesso inválido)
nós tratamos e mostramos mensagem para o usuário.

2. Errors: são erros FATAIS inesperados em sua grande maioria.
dificil de se recuperar, pode parar la no servidor

*/

class UsuarioInvalidoException implements Exception {}

class SenhaInvalidaException implements Exception {}

class DBCaiuError extends Error {}

void autenticar(String usuario, String senha) {
  if (usuario != 'Beatriz Dadalto') {
    // throw UsuarioInvalidoException(); //! é tratado com try catch
    funcao1();
  } else if (senha != 'ADF') {
    throw SenhaInvalidaException(); //! é tratado com try catch
  }
  print('usuário autenticado com sucesso!');
}

void funcao1() {
  funcao2();
}

void funcao2() {
  funcao3();
}

void funcao3() {
  throw UsuarioInvalidoException();
}

void main() {
  try {
    autenticar('Beatriz Dadalto', '123');
  } catch (error, stackTrace) {
    //! esse não é o jeito certo de tratar erro específico
    switch (error) {
      case UsuarioInvalidoException():
        print('Usuário inválido');
      case SenhaInvalidaException():
        print('Senha inválida');
      case _:
        print('Erro inesperado');
    }

    print(stackTrace); //! stackTrace se lê debaixo pra cima
    print(error);
  }
}
