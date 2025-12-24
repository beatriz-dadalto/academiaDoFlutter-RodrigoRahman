class Pagamento {
  final String? cartaoCredito;
  final String? boleto;
  final String? pix;

  Pagamento(this.cartaoCredito, this.boleto, this.pix)
    : assert(
        (cartaoCredito != null && boleto == null && pix == null) ||
            (boleto != null && cartaoCredito == null && pix == null) ||
            (pix != null && cartaoCredito == null && boleto == null),
        'Somente uma forma de pagamento é permitida',
      );
}

void main() {
  final p1 = Pagamento('cartaoCredito', 'boleto', null);
  final p2 = Pagamento(null, 'boleto', null);
  final p3 = Pagamento(null, null, 'pix');
}
