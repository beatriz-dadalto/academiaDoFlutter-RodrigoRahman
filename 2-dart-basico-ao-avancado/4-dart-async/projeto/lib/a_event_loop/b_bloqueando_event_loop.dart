import 'dart:io';

void main() {
  print('Iniciando Main');
  print(temperaturaAtual());
  print(precisaoAmanha());
  print('Finalilzando Main');
}

String temperaturaAtual() {
  sleep(const Duration(seconds: 3)); // trava o processo por 3 segs. jeito errado
  return 'Está fazendo 30';
}

String precisaoAmanha() {
  return 'Amanhã fará 34';
}
