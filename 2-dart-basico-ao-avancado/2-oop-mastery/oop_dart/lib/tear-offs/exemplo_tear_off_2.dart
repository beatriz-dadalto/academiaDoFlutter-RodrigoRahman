class Utils {
  static String inverter(final String s) => s.split('').reversed.join();
  String inverterInstancia(final String s) => s.split('').reversed.join();
}

void imprimirInverso(
  final String nome,
  final String Function(String) inverter,
) {
  final nomeInvertido = inverter(nome);
  print(nomeInvertido);
}

void main() {
  // tear-off = destacar ou extrair

  // tear-off: Utils.inverter
  imprimirInverso('Beatriz Dadalto', Utils.inverter);

  final utils = Utils();

  // tear-off: utils.inverterInstancia
  imprimirInverso('Lord Miuxo', utils.inverterInstancia);
  imprimirInverso('Cometa', utils.inverterInstancia);
}
