// PODE SER INSTANCIADA
// interface class eh uma classe que nao pode ser extendida fora do seu arquivo.
// garantindo que os metodos implementados nao serao alterados!
interface class Notificador {
  void fazUmaRegraDeNegocioQueNaoPodeMudar() {
    enviarNotificacao('teste');
  }

  // Nao pode ser alterado mas precisa ser publico!
  void enviarNotificacao(String mensagem) {
    print('Notificacao padroão');
  }
}

// NAO PODE SER entends fora desse arquivo
class N extends Notificador {}

// class N2 implements Notificador {
//   @override
//   void enviarNotificacap(String mensagem) {}
// }

void main() {
  final n = Notificador();
}
