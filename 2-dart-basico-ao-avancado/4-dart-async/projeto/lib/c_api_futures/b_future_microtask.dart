/*

Future.microtask() executa uma função com ALTA PRIORIDADE no event loop,
em uma fila chamada MICROTASK QUEUE que é processada ANTES da
fila normal de eventos (macrotasks).

Analogia do Mundo Real:
É como ter uma fila de prioridade VIP em um banco:

Event Queue = fila normal (clientes esperam na ordem)
Microtask Queue = guichê executivo que atende PRIMEIRO (operações críticas do banco)

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
