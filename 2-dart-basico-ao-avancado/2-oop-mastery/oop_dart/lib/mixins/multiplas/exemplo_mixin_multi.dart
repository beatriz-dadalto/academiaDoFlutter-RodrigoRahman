mixin MixinA {
  void metodoX() {
    print('Olá Mixin A');
  }
}

mixin MixinB {
  void metodoX() {
    print('Olá Mixin B');
  }
}

class Combinada with MixinA, MixinB {}

void main() {
  final c = Combinada();
  //! o ultimo mixin sobreescreve os anteriores quanto tem a mesma assinatura.
  c.metodoX(); // Olá Mixin B
}
