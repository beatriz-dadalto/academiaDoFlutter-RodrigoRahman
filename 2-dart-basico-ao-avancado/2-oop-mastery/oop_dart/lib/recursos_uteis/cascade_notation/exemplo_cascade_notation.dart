class Pessoa {
  String? nome;
  int? idade;

  void apresentar() {
    print('Olá, meu nome é $nome e eu tenho $idade anos');
  }
}

void main() {
  // CASCADE NOTATION
  final pessoa = Pessoa()
  ..nome = 'Lord Miuxo'
  ..idade = 18
  ..apresentar();

  // obs: normalmente eh usado no pattern Builder

}
