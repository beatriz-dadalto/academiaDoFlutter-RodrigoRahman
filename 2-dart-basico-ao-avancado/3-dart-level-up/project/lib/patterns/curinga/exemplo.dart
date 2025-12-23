final record = (10, '20', 30.0);

enum Status { ativo, inativo, pendente }

void main() {
  final listaNumeros = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  // destructuring do for
  for (final [_, b, _] in listaNumeros) {
    print('B: $b');
  }

  // destructuring do record
  final (param1, _, _) = record; // curinga _

  print('param1: $param1'); // 10

  final status = Status.pendente;

  switch (status) {
    case Status.ativo:
      print('Ativo');
    case Status.inativo:
      print('Inativo');
    case _:
      throw 'Status inválido';
  }

  // validar apenas os tipos coloque _ curinga
  if (record case (int _, String _, _)) {
    print('É um int e String');
  }
}
