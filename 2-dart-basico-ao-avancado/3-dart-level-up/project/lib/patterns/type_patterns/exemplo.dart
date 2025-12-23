void main() {
  // matching com constants literais
  final valor = 45;

  switch (valor) {
    case 0:
      print(0);
      break;
    case 10:
      print(10);
      break;
    case 20:
      print(20);
      break;
  }

  // matching com operadores lógicos e relacionais
  final idade = 42;

  switch (idade) {
    case < 18:
      print('menor de idade');
      break;
    case >= 18 && < 60:
      print('maior de idade');
      break;
  }

  final color = 'red';

  switch (color) {
    case 'red' || 'blue' || 'black':
      print('Cor primaria');
    case _:
      print('outra cor');
  }

  // matching por tipos da variavel
  final dynamic entrada = 10.0;

  switch (entrada) {
    case int _:
      print('');
    case String _:
      print('');
    case double _:
      print('é double');
  }

  // matching relacional
  // a variaveis que vao fazer a relação devem ser constants [const ou final]
  final char = 10;
  const space = 32;
  const zero = 48;
  const nine = 57;

  switch (char) {
    case < space:
      print('');
    case == space:
      print('');
    case > space && < zero:
      print('');
    case >= zero && <= nine:
      print('');
    case _:
      print('');
  }
}
