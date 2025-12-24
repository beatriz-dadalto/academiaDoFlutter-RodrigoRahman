import 'dart:async';

void main() {
  print('Iniciando Main');
  //! event loop respeita processos finalizados. FIFO. o finalizado primeiro sai primeiro
  func1();
  func2();

  print('Finalizando Main');
}

void func1() {
  print('Iniciando func1');
  Future.delayed(Duration(seconds: 2), () => print('Fazendo algo complexo func1'));
  print('Finalizando func1');
}

void func2() {
  print('Iniciando func2');
  Future.delayed(Duration(seconds: 1), () => print('Fazendo algo complexo func2'));
  print('Finalizando func2');
}
