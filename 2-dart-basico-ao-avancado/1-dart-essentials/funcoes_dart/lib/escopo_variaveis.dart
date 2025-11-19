/*
    1. Escopo Global
    2. Escopo da função
    3. Escopo de Bloco
*/

// variavel global (variavel de bivel superior)
var nome = 'Beatriz Dadalto';

void main() {
  print(nome);

  var nomeCompleto = 'Beatriz Coelho Dadalto';
}

void funcaoQualquer() {
  print(nome);
  //print(nomeCompleto);
}
