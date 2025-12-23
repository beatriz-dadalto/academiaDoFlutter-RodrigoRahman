/*

Duas classes para erros:

1. Exceptions: são erros tratáveis ou controlados pelo próprio desenvolvedor
(erro de regra de negocio, usuário inválido, tentativa de acesso inválido)
nós tratamos e mostramos mensagem para o usuário.

2. Errors: são erros FATAIS inesperados em sua grande maioria.
dificil de se recuperar, pode parar la no servidor

*/

class UsuarioInvalidoException implements Exception {}

class ServidorCaiuError extends Error {}

void funcaoComErro() {
  throw (1, 20);
}

void validarUsuario(String usuario) {
  if (usuario != 'Beatriz Dadalto') {
    throw UsuarioInvalidoException(); //!encerra a execução
  }
  print('usuário logado com sucesso!');
}

void main() {
  validarUsuario('Batata'); // para a execução com erro de exception
}
