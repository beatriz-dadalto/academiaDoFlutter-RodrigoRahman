part of 'calculo_funcionario.dart';

// exemplo mais contreto: Funcao para calcular o imposto de renda
String _calcularImpostoRenda(double salario) {
  if (salario <= 2500) {
    return 'Isento';
  } else if (salario <= 5000) {
    return '15% de imposto';
  } else {
    return '27.5% de imposto';
  }
}
