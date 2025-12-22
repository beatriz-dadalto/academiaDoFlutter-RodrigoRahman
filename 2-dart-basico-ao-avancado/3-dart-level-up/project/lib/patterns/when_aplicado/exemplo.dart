void main() {
  final dynamic idade = 42;

  switch (idade) {
    case final int i when i < 18:
      print('Idade: $i - Categoria: Menor de idade.');
    case final int i when i > 18 && i < 60:
      print('Idade: $i - Categoria: Maior de idade');
    case final int i when i > 60:
      print('Idade: $i - Categoria: idoso');
  }

  final salario = 4000;

  // Valida tipo E condição lógica com o when
  if (salario case final int s when s < 2000) {
    print('Salário: $s - Faixa salarial: Salário baixo');
  } else if (salario case final int s when s >= 2000 && s < 5000) {
    print('Salário: $s - Faixa salarial: Salário médio');
  } else if (salario case final int s when s >= 5000) {
    print('Salário: $s - Faixa salarial: Salário médio');
  }

  // Use quando você quer pattern matching com destructuring e validação simultânea
  final resultado = (nome: 'João', idade: 30);

  if (resultado case (nome: final String n, idade: final int i) when i >= 18) {
    print('$n é maior de idade');
  }

}
