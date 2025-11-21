/*
variavel global nao eh auto promovivel por isso precisa fazer CAST

variavel que vem da funcao eh auto promovivel por isso nao precisa fazer CAST
*/

String? nomeGlobal;

void main() {
  String nome = 'Beatriz';
  String? nomeNull;

  nome.length;

  if (nomeNull != null) {
    (nomeNull as String).length;
    nomeNull.length;
  }
}


void imprimirComprimentoSeNaoNulo(String? texto) {
  if (texto != null) {
    print(texto.length);
  }
}

// Precisa fazer CAST porque usa variavel global
void imprimirComprimentoVariavelGlobal() {
  if (nomeGlobal != null) {
    print((nomeGlobal as String).length);
  }
}
