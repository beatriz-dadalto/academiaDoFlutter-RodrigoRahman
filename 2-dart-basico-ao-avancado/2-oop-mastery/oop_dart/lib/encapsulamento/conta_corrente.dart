class ContaCorrente {
  double _saldo = 0.0;

  // se nao tiver regra de negocio a boa pratica no Dart eh nao ter getter e setter

  double get saldo => _saldo;

  double sacar(double valor) {
    if (valor <= _saldo) {
      _saldo -= valor;
      return valor;
    } else {
      print('Saldo $_saldo. Você não tem saldo suficiente!');
      return 0;
    }
  }

  set saldo(double valor) {
    if (valor > 0) {
      _saldo = valor;
    } else {
      print('Valor noa pode ser negativo');
    }
  }

  void depositar(double valorDeposito) {
    if (valorDeposito > 0) {
      _saldo += valorDeposito;
    }
  }
}
