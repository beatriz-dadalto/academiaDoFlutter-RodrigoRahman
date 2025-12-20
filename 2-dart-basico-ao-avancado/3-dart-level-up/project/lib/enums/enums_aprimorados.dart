enum DiaDaSemanaa {
  domingo('Domingo'),
  segunda('Segunda-feira'),
  terca('Terça-feira'),
  quarta('Quarta-feira'),
  quinta('Quinta-feira'),
  sexta('Sexta-feira'),
  sabado('Sábado');

  final String descricao;
  const DiaDaSemanaa(this.descricao);

  DiaDaSemanaa proximo() {
    final proximoIndice = (index + 1) % DiaDaSemanaa.values.length;
    return DiaDaSemanaa.values[proximoIndice];
  }

  static DiaDaSemanaa recuperarDiaSemana(String diaSemana) {
    return DiaDaSemanaa.values.firstWhere((dia) => dia.name == diaSemana);
  }
}

void main() {
  final domingo = DiaDaSemanaa.recuperarDiaSemana('domingo');
  
  print(domingo.proximo().descricao);
}
