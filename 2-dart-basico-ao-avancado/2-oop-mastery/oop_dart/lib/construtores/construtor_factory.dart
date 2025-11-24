class Usuario {
  final String nome;
  final String tipo;

  Usuario._adm(this.nome) : tipo = 'ADMINISTRADOR';
  Usuario._cliente(this.nome) : tipo = 'CLIENTE';

  // use factory quando precisa tomar decisao de qual tipo de instancia deve retornar
  factory Usuario(String nome, String tipo) {
    if (tipo == 'A') {
      return Usuario._adm(nome);
    } else if (tipo == 'C') {
      return Usuario._cliente(nome);
    } else {
      throw ArgumentError('Tipo de usuário inválido');
    }
  }

  void exibirInformacoes() {
    print('Usuário: $nome, é $tipo');
  }
}

void main() {
  final adm = Usuario('Lord', 'A');
  adm.exibirInformacoes();

  final cliente = Usuario('Mia', 'C');
  cliente.exibirInformacoes();
}
