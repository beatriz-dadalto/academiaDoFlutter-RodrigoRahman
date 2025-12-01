base class Veiculo {
  final String marca;
  final String modelo;

  Veiculo({required this.marca, required this.modelo});

  void exibirDados() {
    print('Exibir: $modelo, $marca');
  }
}

base class Carro extends Veiculo {
  Carro({required super.marca, required super.modelo});
}

// pode ser implements apenas na mesma library/file
base class Moto implements Veiculo {
  @override
  void exibirDados() {
  }

  @override
  String get marca => throw UnimplementedError();

  @override
  String get modelo => throw UnimplementedError();

}
