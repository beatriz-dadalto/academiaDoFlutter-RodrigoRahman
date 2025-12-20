enum Direcao { norte, sul, leste, oeste }

void main() {
  var valoresEnum = Direcao.values;

  print('Index ${Direcao.leste.index}: nome = ${Direcao.leste.name}');

  for (final v in valoresEnum) {
    print('${v.index}: ${v.name}');
  }

  print(recuperarDirecao('oeste'));
}

Direcao recuperarDirecao(String nomeDirecao) {
  return Direcao.values.firstWhere((direcao) => direcao.name == nomeDirecao);
}
