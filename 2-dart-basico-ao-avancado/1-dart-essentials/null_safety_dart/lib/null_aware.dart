/*
  o ?? verifica se eh nulo e atribui um valor
  pode ser um valor ou expressao.
 */

String? nome;

void main() {
  String saudacao = 'Olá ${nome ?? 'Pessoa'}';
  print(saudacao);
  exemploNullAwareAssigment();
  String saudacao2 = 'Olá ${retornarValorNull() ?? 'Pessoa2'}';
  String saudacao3 = 'Olá ${retornarValorNull() ?? retornaValor()}';
  print(saudacao2);
  print(saudacao3);
}

// Null aware Assigment
void exemploNullAwareAssigment() {
  nome ??= 'Pessoa nulo';
  print(nome);
}

String? retornarValorNull() {
  return null;
}

String retornaValor() {
  return 'valor';
}
