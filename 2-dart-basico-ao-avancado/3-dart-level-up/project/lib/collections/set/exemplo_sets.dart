import 'dart:collection';

void main() {
  // para criar set {} || para criar lista []
  final listToSet = ['bia', 'lord', 'anny', 'coração'];
  print('Lista: $listToSet');
  final fromList = listToSet.toSet();
  final numeros = <int>{1, 2, 3, 4, 5};
  print('Set: $fromList');
  print('De set para list: ${fromList.toList()}');

  // nao da pra acessar por index. precisa ser pelo elementAt()
  for (final n in numeros) {
    print(n);
  }

  // dessa forma duplica porque as referencias são diferentes, são 3 instancias!
  // mas se tiver implementado o equatabily ele faz a comparacao e nao duplica.
  final pessoas = {
    PessoaSet('Beatriz'),
    PessoaSet('Dadalto'),
    PessoaSet('Beatriz'),
  };

  for (final p in pessoas) {
    print(p.nome);
  }

  // dessa forma nao duplica
  final beatriz = PessoaSet('Bia');
  final pessoas2 = {beatriz, PessoaSet('beatriz'), beatriz};
  print(pessoas2);

  // é a mais rápida mais nao tem ordem
  final pessoaHashSet = HashSet.from({
    PessoaSet('Bia1'),
    PessoaSet('Bia3'),
    PessoaSet('Beatriz__3'),
  });
  print('HashSet: $pessoaHashSet');
}

class PessoaSet {
  String nome;
  PessoaSet(this.nome);

  @override
  String toString() {
    return 'Pessoa $nome';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PessoaSet && other.nome == nome;
  }

  @override
  int get hashCode => nome.hashCode;
}
