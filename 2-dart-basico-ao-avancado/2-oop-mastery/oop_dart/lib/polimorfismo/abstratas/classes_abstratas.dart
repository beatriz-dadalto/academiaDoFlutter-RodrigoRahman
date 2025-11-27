abstract class RelatorioFinanceiro {
  String gerar();

  void enviar(String path) {
    print('Relatorio enviado $path');
  }
}

class RelatorioFinanceiroMensal extends RelatorioFinanceiro {
  @override
  String gerar() {
    print('Gerando relatorioMensal');
    return '/relatorioMensal.pdf';
  }
}

class RelatorioFinanceiroAnual extends RelatorioFinanceiro {
  @override
  String gerar() {
    print('Gerando relatorioAnual');
    return '/relatorioAnual.pdf';
  }
}

void processarRelatorio(RelatorioFinanceiro relatorioFinanceiro) {
  final path = relatorioFinanceiro.gerar();
  relatorioFinanceiro.enviar(path);
}

void main() {
  final relatorioMensal = RelatorioFinanceiroMensal();
  final relatorioAnual = RelatorioFinanceiroAnual();

  processarRelatorio(relatorioMensal);
  processarRelatorio(relatorioAnual);
}
