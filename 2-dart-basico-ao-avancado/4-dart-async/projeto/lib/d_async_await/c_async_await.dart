//! comparação usando a API de Future padrão e suando async await

Future<int> buscarId() async => 80;

Future<String> buscarNome(int id) async => 'Beatriz Dadalto ($id)';

// PADRÃO
Future<String> buscarNomeUsuario() {
  return buscarId().then((id) {
    return buscarNome(id).then((nome) {
      return 'Padrão -> Usuário: $nome';
    });
  });
}

// ASYNC AWAIT - repare que fica mais natural e menos verboso
Future<String> buscarNomeUsuarioAwait() async {
  final id = await buscarId();
  final nome = await buscarNome(id);
  return 'async await: Usuário $nome';
}

void main() async {
  print('Init main');

  buscarNomeUsuario().then(print);

  buscarNomeUsuarioAwait().then(print);

  // poderia ser assim tambem. mas precisa add async no metodo main e ele
  //deixa de ter prioridade no event loop
  final nomeUsuario = await buscarNomeUsuarioAwait();
  print(nomeUsuario);

  print('End main');
}
