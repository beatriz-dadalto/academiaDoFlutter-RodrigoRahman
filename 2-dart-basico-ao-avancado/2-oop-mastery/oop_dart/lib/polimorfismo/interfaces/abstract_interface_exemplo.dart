//INTERFACE PURA COMO NOS CONHECEMOS NO MUNDO POO
//! NUNCA DEVEM TER METODOS IMPLEMENTADOS
abstract interface class ProcessadorPagamento {
  void processarPagamento(double valor);
}

abstract interface class GerarRelatorio {
  String gerarRelatorioFechamento();
}

class SistemaPagamento implements ProcessadorPagamento, GerarRelatorio {
  double _saldo = 0.0;

  @override
  String gerarRelatorioFechamento() {
    return 'Relatorio: saldo atual é R\$ ${_saldo.toStringAsFixed(2)}';
  }

  @override
  void processarPagamento(double valor) {
    _saldo += valor;
    print(
      'Pagamento de R\$ ${valor.toStringAsFixed(2)} processado com sucesso',
    );
  }
}

void processarPagamento(ProcessadorPagamento pagamento, double valor) {
  pagamento.processarPagamento(valor);
}

void gerarRelatorioFechamento(GerarRelatorio gerarRelatorioFechamento) {
  print(gerarRelatorioFechamento.gerarRelatorioFechamento());
}

void main() {
  final sistemaPagamento = SistemaPagamento();
  processarPagamento(sistemaPagamento, 200);
  processarPagamento(sistemaPagamento, 100.4);
  processarPagamento(sistemaPagamento, 10.0);

  gerarRelatorioFechamento(sistemaPagamento);
}
