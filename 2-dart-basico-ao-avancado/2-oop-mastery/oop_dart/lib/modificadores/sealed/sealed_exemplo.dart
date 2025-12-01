sealed class Forma {
  double calcularArea();

  Forma();

  factory Forma.circulo(double raio) => Circulo(raio);
  factory Forma.retangulo(double largura, double altura) =>
      Retangulo(largura: largura, altura: altura);
}

final class Circulo extends Forma {
  final double raio;

  Circulo(this.raio);

  @override
  double calcularArea() => 3.14 * raio * raio;
}

final class Retangulo extends Forma {
  final double largura;
  final double altura;

  Retangulo({required this.largura, required this.altura});

  @override
  double calcularArea() => largura * altura;
}

void main() {
  Forma forma1 = Forma.circulo(2);
  Forma forma2 = Forma.retangulo(4, 2);
  Forma forma = Circulo(5);

  switch (forma) {
    case Circulo():
      // TODO: Handle this case.
      throw UnimplementedError();
    case Retangulo():
      // TODO: Handle this case.
      throw UnimplementedError();
  }
}
