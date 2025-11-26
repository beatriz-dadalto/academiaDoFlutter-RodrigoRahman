class Funcionario {
  String nome;
  double salarioBase;

  Funcionario(this.nome, this.salarioBase);

  double calcularSalario() {
    return salarioBase;
  }
}

class Gerente extends Funcionario {
  double bonus;
  Gerente(super.nome, super.salarioBase, this.bonus);

  @override
  double calcularSalario() {
    return salarioBase + bonus;
  }
}

class Desenvolvedor extends Funcionario {
  double horasExtras;
  double valorHoraExtra;

  Desenvolvedor(
    super.nome,
    super.salarioBase,
    this.horasExtras,
    this.valorHoraExtra,
  );

  @override
  double calcularSalario() {
    return salarioBase + (horasExtras * valorHoraExtra);
  }
}

void main() {
  final funcionarioComum = Funcionario('Rodrigo Func', 2000);
  print(funcionarioComum.calcularSalario());

  final gerente = Gerente('Beatriz', 10000, 2000);
  print('Gerente: ${gerente.calcularSalario()}');

  final desenvolvedor = Desenvolvedor('Lord Miuxo', 20000, 200, 200);
  print('Desenvolvedor: ${desenvolvedor.calcularSalario()}');
}
