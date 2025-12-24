import 'dart:async';

void main() {
  print('Início main');

  /* Fila de eventos:
    é a fila padrão de execução de processos como leitura de aruivo, HTTP,
    banco de dados e entre outros */
  Timer.run(() => print('Event 2')); // conceito FIFO
  Timer.run(() {
    scheduleMicrotask(() => print('Nova Microtask 1'));
    print('Event 1');
  });
  Timer.run(() => print('Event 3'));

  /* Essa fila tem a MAIOR PRIORIDADE em todo o sistema, sempre que algum
  processo entrar nessa fila ele será executado primeiro que qualquer outro */
  scheduleMicrotask(() => print('MicroTask 2'));
  scheduleMicrotask(() => print('MicroTask 1'));
  scheduleMicrotask(() => print('MicroTask 3'));

  print('Fim main');
}
