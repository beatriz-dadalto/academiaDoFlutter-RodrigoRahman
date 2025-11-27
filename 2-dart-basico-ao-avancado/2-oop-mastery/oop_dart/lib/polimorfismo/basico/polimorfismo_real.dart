class Pagamento {
  void realizarPagamento() {}
}

class CArtaoCredito extends Pagamento {
  @override
  void realizarPagamento() {
    print('Pagamento com cartao de crédito');
  }
}

class Pix extends Pagamento {
  @override
  void realizarPagamento() {
    print('Pagamento com Pix');
  }
}

class FinanciamentoEstudantilPrincipia extends Pagamento {
  @override
  void realizarPagamento() {
    print('Pagamento com Financiameto Estudantil');
  }
}

void checkout(Pagamento pagamento) {
  pagamento.realizarPagamento();
}
