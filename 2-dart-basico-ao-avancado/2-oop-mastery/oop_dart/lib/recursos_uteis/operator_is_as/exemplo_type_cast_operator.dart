class Animal {
  void fazerSom() {
    print('Som genérico');
  }
}

class Cachorro extends Animal {
  @override
  void fazerSom() {
    print('Latido');
  }

  void buscarBola() {
    print('Buscar bola...');
  }
}

class Gato extends Animal {
  @override
  void fazerSom() {
    print('Miado');
  }
}

void main() {
  final animais = [Cachorro(), Gato(), Animal()];

  // final Animal animalCachorro = Cachorro();
  // final cachorro = animalCachorro as Cachorro;
  // cachorro.buscarBola();

  for (final animal in animais) {
    animal.fazerSom();
    final cachorro = animal as Cachorro; //! as : tanta converter em tempo de execução. pode dar erro de null reference
    cachorro.buscarBola();
  }
}
