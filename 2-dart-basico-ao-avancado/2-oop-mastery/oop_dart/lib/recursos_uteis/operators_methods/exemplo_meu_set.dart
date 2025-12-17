class MeuSet {
  final Map<String, String> _dados = {};

  String operator [](final String chave) => _dados[chave] ?? '';

  // criando um Set
  void operator []=(final String chave, final String valor) {
    if (!_dados.containsKey(chave)) {
      _dados[chave] = valor;
    }
  }
}

void main() {
  final mapa = MeuSet();
  mapa['nome'] = 'Beatriz'; // inserido: _dados['nome'] = 'Beatriz'
  mapa['nome'] = 'Anny'; // rejeitado: a chave já existe, nada acontece

  print(mapa['nome']);  // imprime: Beatriz (não mudou)
}
