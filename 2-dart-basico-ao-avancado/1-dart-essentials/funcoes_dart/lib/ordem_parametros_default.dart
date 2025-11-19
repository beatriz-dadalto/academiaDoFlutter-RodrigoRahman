void main() {
  print(saudacao('beatriz dadalto'));
}

// parametros obrigatorios com opcionais
void funcao1(String nome, [int? idade, String? saudacao]) {}

void funcao2(String nome, {required int idade, String? saudacao = 'Olá'}) {}

//! Nao eh permitido parametros opcionais com nomeados
// void funcao3([String? teste], {required int idade, String? saudacao}) {}

// valores default para parametros opcionais
String saudacao(String nome, [String saudacao = 'olá']) {
  return '$saudacao, $nome';
}
