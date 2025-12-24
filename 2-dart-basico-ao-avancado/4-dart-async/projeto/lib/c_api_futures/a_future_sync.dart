/*
Future.sync() é um construtor do Dart que executa uma função sincronamente
(no fluxo normal do event loop), mas envolve o resultado em um Future para que
você possa trabalhar com .then() e outras operações assíncronas.

Como funciona:
A função dentro de sync() executa imediatamente - na mesma "volta" do event loop
O .then() é adiado - só executa na próxima iteração do event loop

Quando usar o Future.sync():
- Quando você quer executar código síncrono mas precisa retornar um
Future para manter consistência na API
- Quando a função já tem o resultado disponível e não precisa esperar por nada

*/

void main() {
  print('Init main');

  Future<String>.sync(() {
    // com o sync executa no fluxo normal do event loop, mas o then()
    // só é executado na próxima interação do event loop
    print('Função future executada');
    return 'Resultado future';
  }).then(print);

  print('Fim main');
}
