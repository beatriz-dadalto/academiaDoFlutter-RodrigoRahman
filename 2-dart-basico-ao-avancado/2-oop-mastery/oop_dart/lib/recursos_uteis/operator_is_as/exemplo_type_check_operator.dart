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
    //! check operator serve para verificar o tipo do obj
    print('é Cachorro: ${animal is Cachorro}'); // true
    print('é Gato: ${animal is Gato}'); // false

    if (animal is! Cachorro) {
      print('Não é um cachorro');
    }
    print('--fazendo som--');
    animal.fazerSom();
    print('--fim som--');

    if (animal is Cachorro) {
      /*use 'AS' apenas se tem certeza que o tipo eh cachorro caso contrario
      dará erro. se nao tem certeza do tipo use o 'IS'*/
      final cachorro = animal as Cachorro;
      cachorro.buscarBola();
    }
  }
}

void checarTipo(dynamic val) {
  if (val is String) {
    val.toLowerCase();
  } else if (val is int) {
    val.isEven;
  }
}
