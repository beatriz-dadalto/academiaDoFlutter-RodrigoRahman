String? nomeGlobal;

void main() {
  // usar ! estamos dizendo que a variavel nao eh nula. CUIDADO.
  //!quando usar ! sempre verifique antes se eh diferente de nulo
  if (nomeGlobal != null) {
    // print((nomeGlobal as String).length); o ! faz a mesma coisa
    print(nomeGlobal!.length);
  }

  String? message = obterMensagem();

  if (message != null) {
    print(message.length);
  }
}

String? obterMensagem() {
  return 'Mensagem da ADF';
}
