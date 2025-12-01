abstract interface class MetodoPagamento {
  void pagar(double valor);
}

class ServicoReserva {
  final MetodoPagamento metodoPagamento;

  ServicoReserva(this.metodoPagamento);

  void reservar(int quantidadePessoas, String tipoQuarto) {
    double valorDiaria = 0.0;

    if (tipoQuarto == 'Luxo') {
      valorDiaria = 1000.0;
    }

    final valorTotalReserva = quantidadePessoas * valorDiaria;
    metodoPagamento.pagar(valorTotalReserva);
  }
}

class CartaoCredito implements MetodoPagamento {
  @override
  void pagar(double valor) {
    print('Pagando com cartão no valor: $valor');
  }
}

class Pix implements MetodoPagamento {
  @override
  void pagar(double valor) {
    print('Pagando com Pix no valor $valor');
  }
}

void main() {
  var servicoReserva = ServicoReserva(CartaoCredito());
  var servicoReserva2 = ServicoReserva(Pix());

  servicoReserva.reservar(4, 'Luxo');
  servicoReserva2.reservar(2, 'Luxo');
}
