void main() {
  final totalAlunos = buscarTotalDeAlunos();

  totalAlunos.then((totalAlunosValue) {
    print('O total de alunos da ADF é $totalAlunosValue');
  });
  
  print('Resposta: $totalAlunos'); // Resposta: Instance of 'Future<int>'
}

Future<int> buscarTotalDeAlunos() async {
  print('Esse ponto do metodo é sincrono');

  // await faz esperar a execucao e quando termina pelo event loop ele
  //guarda na variavel buscandoTotalDeAlunos. seria o mesmo de recuperar o
  // valor usando o then()
  final buscandoTotalDeAlunos = await Future.value(887);

  print('Esse ponto do metodo é depois do await');

  return buscandoTotalDeAlunos;
}
