void main() {
  Function funcaoRecuperarIdade = recuperarIdade;

  mostrarNome();

  print(funcaoRecuperarIdade());
}

// Toda funcao deve retonar um valor, nunca deve ser deixado vazio
int recuperarIdade() {
  return 18;
}

void mostrarNome() {
  print('Meu nome é Beatriz Dadalto');
}
