String verificarElegibilidade(int idade) {
  if (idade >= 18) {
    return 'Elegível para cadastro';
  } else {
    return 'Não elegível para cadastro';
  }
}
