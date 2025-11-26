class RelatorioFinanceiroBase {
  void gerarRelatorio() {
    print('Gerando relatorio base com cabeçalho e outras formulas básicas');
  }
}

class RelatorioFinanceiroMensal extends RelatorioFinanceiroBase {
  @override
  void gerarRelatorio() {
    super.gerarRelatorio();
    print('Adicionando dados mensais ao relatorio');
  }

  void adicionarAlgo() {
    super.gerarRelatorio();
    print(
      'posso adicionar algo e tambem chamar o gerarRelatorio mesmo nao sendo um @override',
    );
  }
}

void main() {
  final relatorio = RelatorioFinanceiroMensal();
  relatorio.gerarRelatorio();
  relatorio.adicionarAlgo();
}
