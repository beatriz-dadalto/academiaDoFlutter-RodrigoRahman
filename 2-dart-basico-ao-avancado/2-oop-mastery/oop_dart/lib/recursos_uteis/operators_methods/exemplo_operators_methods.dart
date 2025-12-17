/*
operator +, -, * — operações aritméticas.
operator ==, <, > — comparação.
operator [], []= — indexação (get/set).
operator ~, &, | — bitwise.
operator [] pode ser overloaded com múltiplas aridades (parâmetros).
*/

class MeuInteiro {
  int numero;
  MeuInteiro(this.numero);

  MeuInteiro soma(final MeuInteiro outroValor) {
    return MeuInteiro(numero + outroValor.numero);
  }

  MeuInteiro operator +(final MeuInteiro outroValor) {
    return MeuInteiro(numero + outroValor.numero);
  }
}

void main() {
  final valor1 = MeuInteiro(10);
  final valor2 = MeuInteiro(20);

  // eh possível calcular assim pq fou criado com [operator]
  final soma = valor1 + valor2;
  print(soma.numero);
}
