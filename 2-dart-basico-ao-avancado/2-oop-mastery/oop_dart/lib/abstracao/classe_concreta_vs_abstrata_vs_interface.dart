abstract class MeioPagamento {
  void realizarPagamento();
  void emitirPagamento() {
    print('comprovante');
  }
}

class PagamentoBoleto extends MeioPagamento {
  @override
  void realizarPagamento() {}
}

abstract interface class GatewayPagamento {
  void processarPagamento();
  bool pagamentoConfirmado();
}

abstract class GatewaypagamentoADF implements GatewayPagamento {
  @override
  bool pagamentoConfirmado() {
    throw UnimplementedError();
  }
}

class GatewayHotmart extends GatewaypagamentoADF {
  @override
  void processarPagamento() {}

  void qualquer() {}
}

void main() {
  final GatewayPagamento hotmart = GatewayHotmart();
}
