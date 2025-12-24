/*

Future.microtask() executa uma função com ALTA PRIORIDADE no event loop,
em uma fila chamada MICROTASK QUEUE que é processada ANTES da
fila normal de eventos (macrotasks).

Quando usar:
- Quando você precisa que algo execute antes de outras futures
- Para operações internas críticas que devem ter prioridade
- Cuidado: Usar em excesso pode bloquear o event loop!

*/

void main() {
  print('Init main');

  Future<String>(() => 'Future Normal').then(print);

  // evento com prioridade
  Future<String>.microtask(
    () => Future.error('Erro ao executar'),
  ).then(print).catchError(print);

  print('End Main');
}
