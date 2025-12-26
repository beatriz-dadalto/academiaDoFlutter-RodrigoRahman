Future<void> main() async {
  print('Init main');

  final nomes = ['Beatriz', 'Anny', 'Lord'];

  //! forEach não é recomendado para assincrono. use for in
  // nomes.forEach((nome) async {
  //   final saudacaoNome = await saudacao(nome);
  //   print(saudacaoNome);
  // });

  // mas dessa forma nao está fazendo paralelo, ele esta fazendo um após o outro
  // para isso use o Future.forEach()
  for (var nome in nomes) {
    await tratarSaudacao(nome);
  }

  // executa de forma SEQUENCIAL
  await Future.forEach<String>(nomes, (nome) async {
    await tratarSaudacao(nome);
  });

  // Future.wait (PARALELA) espera todos executarem porque só interessa todas as respostas
  // roda em paralelo, registra todos dentro do event loop e depois espera a
  // execução de todos de uma vez. com Future.forEach envia no event loop um por vez
  // resumo: Future.wait resolve todos e depois processa de uma vez com todas as respostas
  final nomesFuture = nomes.map((nome) => saudacao(nome)).toList();
  final nomesProcessados = await Future.wait(nomesFuture);
  print(nomesProcessados);

  print('End main');
}

Future<void> tratarSaudacao(String nome) async {
  final saudacaoNome = await saudacao(nome);
  print(saudacaoNome);
}

Future<String> saudacao(String nome) {
  print('inicio saudação $nome');

  return Future.delayed(Duration(seconds: 1), () {
    print('Fim saudação nome: $nome');
    return 'Olá $nome';
  });
}
