class Animal {
  void emitirSom() {}
}

class Cachorro extends Animal {
  String get nome => 'Marley';
  @override
  void emitirSom() {
    print('AuAu!');
  }
}

class Gato extends Animal {
  @override
  void emitirSom() {
    print('Miau!');
  }
}

class Marley extends Cachorro {}

void fazerBarulho(Animal animal) {
  animal.emitirSom();
}

void main() {
  final Animal cachorro = Cachorro();
  final Animal gato = Gato();
  final marley = Marley();
  // a classe pai identifica pelo TIPO
  fazerBarulho(cachorro); // AuAu
  fazerBarulho(gato); // Miau
  fazerBarulho(marley); // AuAu
}
