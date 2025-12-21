class PessoaDestructuring {
  final String nome;
  final int idade;

  PessoaDestructuring(this.nome, this.idade);

  void metodoQualquer() {
    print('Ola, Mundo!');
  }

  @override
  String toString() {
    return 'Pessoa(nome: $nome, idade: $idade)';
  }
}

void main() {
  final [a, b, c] = [10, 20, 30];
  print(a + b + c); // 60

  final listaMaior = [10, 20, 30, 40, 50, 60, 70];

  // ... rest operator: só quero os 3 primeiros elementos, o resto (...) não importa!
  // Rest Elements
  final [d, e, f, ...] = listaMaior;

  final [g, h, i, ...resto] = listaMaior;
  print(
    'G: $g, H: $h, I: $i, Resto: $resto',
  ); // G: 10, H: 20, I: 30, Resto: [40, 50, 60, 70]

  final [primeiro, ...meio, penultimo, ultimo] = listaMaior;
  print(
    'Primeiro: $primeiro, Meio: $meio, Penultimo: $penultimo, Último: $ultimo',
  );

  // destructuring record
  final record = ('Rodrigo', 25);
  final (nomePosicional, idadePosicional) = record;

  final recordNomeado = (nome: 'Rodrigo', idade: 42);
  final (nome: nomeNomeado, idade: idadeNomeado) = recordNomeado;

  final recordNomeado2 = (nome2: 'Rodrigo', idade2: 42);
  final (:nome2, :idade2) = recordNomeado2;

  // destructuring CLASS
  final pessoaDestructuring = PessoaDestructuring('beatriz', 18);
  final PessoaDestructuring(:idade, :nome, :metodoQualquer) =
      pessoaDestructuring;

  print('Classe Pessoa => $idade, $nome');
  metodoQualquer();

  final nomeStr = 'Beatriz';
  final String(:toLowerCase) = nomeStr;
  toLowerCase();

  // destructuring MAP
  final mapa = {'endereco': 'rua abel', 'nacionalidade': 'brasileira'};
  final {'endereco': valor1, 'nacionalidade': valor2} = mapa;

  print(valor1);
  print(valor2);
}
