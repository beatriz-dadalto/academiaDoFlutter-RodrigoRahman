class Pedido {
  int id;
  String descricao;
  DateTime data;
  double valor;

  Pedido(this.id, this.descricao, this.data, this.valor);

  // construtor nomeado porque nao eh permitido a sobreescrita de construtor
  Pedido.criarPedido(this.id, this.descricao, this.valor)
    : data = DateTime.now();

  Pedido.comDesconto(
    this.id,
    this.descricao,
    double valorOriginal,
    double desconto,
  ) : data = DateTime.now(),
      valor = valorOriginal - (valorOriginal * desconto);
}

void main() {
  final p1 = Pedido(1, 'Bola de cristal', DateTime.now(), 500.00);
  final p2 = Pedido.criarPedido(2, 'Mac book', 15.000);
  final pDesconto = Pedido.comDesconto(3, 'Roupa', 300.00, 0.1);

  print(pDesconto.valor);
}
