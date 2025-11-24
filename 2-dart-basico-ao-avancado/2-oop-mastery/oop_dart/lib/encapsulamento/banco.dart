import 'package:oop_dart/encapsulamento/conta_corrente.dart';

void main() {
  final contaCorrente = ContaCorrente();
  contaCorrente.saldo = 300.50;
  final valorSaque = contaCorrente.sacar(200.10);
  print('Valor do saque: $valorSaque');
  print('Saldo: ${contaCorrente.saldo}'); // getter
  contaCorrente.depositar(1000);
  print('Saldo: ${contaCorrente.saldo}'); // getter
}
