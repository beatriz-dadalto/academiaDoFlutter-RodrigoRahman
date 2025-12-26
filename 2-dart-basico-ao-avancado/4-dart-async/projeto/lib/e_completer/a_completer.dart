import 'dart:async';

/*
O que é?
Completer é uma classe que cria um Future que você controla manualmente.
Enquanto um Future.delayed() ou async/await faz o controle automaticamente, com
Completer você decide quando resolver ou rejeitar o Future.

Resumo 🎯
Completer é usado quando:

✅ Precisa envolver APIs callback-based em Future
✅ Precisa de controle manual sobre quando resolver
✅ Operações complexas com múltiplos callbacks
✅ Integrar código legado com código moderno async
NÃO use quando:

❌ Pode usar async/await (mais simples)
❌ Pode usar Future.delayed() ou Future.value() (mais direto)
❌ Seu código já é naturalmente assíncrono

Regra de Ouro: Use Completer como último recurso quando não conseguir usar async/await. 🎯

*/

Future<void> main() async {
  // sem async await
  buscarAlgo(0)
      .then((value) => print('Mensagem: $value'))
      .catchError((error) => print('Erro: $error'));

  // com async await deve tratar com try catch
  try {
    final mensagem = await buscarAlgo(2);
    print('Mensagem: $mensagem');
  } catch (e, s) {
    print('Deu erro: $e');
    print(s);
  }
}

Future<String> buscarAlgo(int numero) {
  final completer = Completer<String>();

  Timer(Duration(seconds: 2), () {
    if (numero == 0) {
      //! Resolver com sucesso
      completer.complete('Número enviado com sucesso');
    } else {
      //! Resolver com erro
      completer.completeError('Numero enviado com erro', StackTrace.current);
    }
  });

  // Obter o Future
  return completer.future;
}
