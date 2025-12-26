Future<void> main() async {
  print('Init main');

  //! quando trabalha com async await se usa try cath para tratar erros
  try {
    final id = await buscarId();
    final nome = await buscarNome(id);

    print('o nome é $nome');
  } catch (e, s) {
    print('Deu erro: $e');
    print(s);
  }

  print('End main');
}

Future<int> buscarId() async => 80;

Future<String> buscarNome(int id) async {
  throw Exception();
  // return 'Beatriz Dadalto ($id)';
}
