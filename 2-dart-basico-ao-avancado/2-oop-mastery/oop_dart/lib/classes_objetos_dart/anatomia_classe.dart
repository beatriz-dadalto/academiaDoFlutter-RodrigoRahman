class Pessoa {
  String? nome;
  int? idade;

  Pessoa();

  // metodos
  void exibirInformacoes() {
    print('Nome: $nome, Idade: $idade');
  }

  bool ehMaiorDeIdade() {
    if (idade != null) {
      return idade! >= 18;
    }
    return false;
  }
}

void main() {
  final pessoa = Pessoa();
  
  pessoa.nome = 'Lord Miuxo Galiati Dadalto';
  pessoa.idade = 3;

  pessoa.exibirInformacoes();

  if (pessoa.ehMaiorDeIdade()) {
    print('${pessoa.nome} é maior de idade');
  } else {
    print('${pessoa.nome} não é maior de idade');
  }
}
