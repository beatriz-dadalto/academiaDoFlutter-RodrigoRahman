// classes que sao chamadas como funcoes. classes que tem um unico objetivo, um unico metodo call()
class Saudacao {
  final String mensagem;

  Saudacao({required this.mensagem});

  void call(final String nome) {
    print('$mensagem, $nome!');
  }
}

void main() {
  final saudacao = Saudacao(mensagem: 'Bem-vinda');
  saudacao('Beatriz');
  saudacao('Lord');
  saudacao('Anny');
}
