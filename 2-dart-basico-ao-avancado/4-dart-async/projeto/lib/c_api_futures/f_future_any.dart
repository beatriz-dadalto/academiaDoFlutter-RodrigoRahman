/*
O que é?
Future.any é um método que recebe uma lista de Futures e retorna um novo Future
que se resolve com o resultado do primeiro Future que terminar,
independentemente de sucesso ou erro.

Características principais:
1. Retorna o primeiro resultado: Completa assim que qualquer um dos Futures da lista termina
2. Não cancela os outros: Os demais Futures continuam executando em segundo plano (apenas são ignorados)
3. Aceita erro ou sucesso: Resolve com o primeiro resultado, seja ele um valor ou uma exceção

Quando usar:
- Redundância/Fallback: Fazer múltiplas chamadas à API e usar a primeira que responder
- Timeouts: Competição entre um request e um timeout
- Pool de servidores: Chamar múltiplos servidores e usar o que responder primeiro
- Tentativas paralelas: Executar a mesma operação em múltiplas threads/fontes

! A diferença para Future.wait é que wait aguarda todos os Futures terminarem,
enquanto any retorna assim que o primeiro terminar.

*/

void main() {
  print('Init main');

  // var f5 = Future.delayed(
  //   Duration(seconds: 1),
  //   () => Future.error('Erro na execucao'),
  // );
  var f1 = Future.delayed(Duration(seconds: 2), () => 'F1');
  var f2 = Future.delayed(Duration(seconds: 1), () => 'F2');
  var f3 = Future.delayed(Duration(seconds: 3), () => 'F3');
  var f4 = Future.delayed(Duration(milliseconds: 200), () => 'F4');

  // Future.any não cancela os outros apenas são ignorados. ele retorna apenas
  // o primeiro que terminou independente se foi erro ou sucesso
  Future.any([f1, f2, f3, f4]).then(print).catchError(print);

  print('End Main');
}
