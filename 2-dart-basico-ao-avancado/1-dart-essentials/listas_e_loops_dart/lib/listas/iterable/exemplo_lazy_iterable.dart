void main() {
  final listaNumeros = List.generate(5, (i) => i + 1);

  final filtrados = listaNumeros.where((n) {
    print('Filtrando executa em: $n');
    return n.isEven;
  });

  final listaBatatas = filtrados.map((numero) {
    print('Map executado em: $numero');
    return 'Batata $numero';
  });


  print('Nenhuma operação foi executa ainda');
  print(listaBatatas.toList());
}
