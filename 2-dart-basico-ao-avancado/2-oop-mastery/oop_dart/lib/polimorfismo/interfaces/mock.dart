abstract interface class Repositorio {
  String buscarDado();

  void salvarDados(String dado);
  void deletarDado(String id);
  List<String> listarDados();
}

class RepositorioImpl implements Repositorio {
  @override
  String buscarDado() {
    return 'dado';
  }

  @override
  void deletarDado(String id) {}

  @override
  List<String> listarDados() {
    return [];
  }

  @override
  void salvarDados(String dado) {}
}

void buscarOsDados(Repositorio repositorio) {
  print(repositorio.buscarDado());
}

class MockRepositorio implements Repositorio {
  // funciona apenas no DArt com testes, nao no flutter
  @override
  noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #buscarDado) {
      return 'Batata';
    }
    return super.noSuchMethod(invocation);
  }
}

void main() {
  final r = RepositorioImpl();
  final rMock = MockRepositorio();

  buscarOsDados(r);
  buscarOsDados(rMock);
}
