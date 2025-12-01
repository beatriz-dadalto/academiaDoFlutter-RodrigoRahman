final class Veiculo {
  final String marca;
  final String modelo;

  Veiculo({required this.marca, required this.modelo});

  void exibirDados() {
    print('Exibir: $modelo, $marca');
  }
}

final class Carro extends Veiculo {
  Carro({required super.marca, required super.modelo});
}

final class Moto implements Veiculo { 
  @override
  void exibirDados() {
  }

  @override
  String get marca => throw UnimplementedError();

  @override
  String get modelo => throw UnimplementedError();

}
