import 'package:oop_dart/encapsulamento/produto.dart';

void main() {
  final produto = Produto();
  print('Preço inicial é ${produto.preco}'); // getter
  produto.preco = 5.50; // setter
  print('Preço alterado é ${produto.preco}');
}
