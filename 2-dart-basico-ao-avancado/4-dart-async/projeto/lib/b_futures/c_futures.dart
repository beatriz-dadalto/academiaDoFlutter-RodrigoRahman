void main() {
  //! Anatomia do Future

  // Future: Incompleto, Completo com sucesso, Completo com erro

  Future(() {
    // funcao assincrona
  }).then((value) {
    // registrando função que será executada quando o future estiver completo com SUCESSO
  }).catchError((error) {
    // registrando função que será executada quando o future estiver completo com ERRO
  }).whenComplete(() {
    // registrando a função que será executada SEMPRE independente quando deu erro ou sucesso
  });

}
