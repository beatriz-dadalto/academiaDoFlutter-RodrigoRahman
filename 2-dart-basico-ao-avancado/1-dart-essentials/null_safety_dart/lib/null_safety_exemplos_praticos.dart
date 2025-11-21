// ignore_for_file: unused_local_variable

String? cadastrarUsuario(String? nome, String? email) {
  if (nome != null) {
    var nomeMaiusculo = nome.toUpperCase();
    if (email != null) {
      return 'usuário cadastrado com sucesso';
    }
  }
  return null;
}
