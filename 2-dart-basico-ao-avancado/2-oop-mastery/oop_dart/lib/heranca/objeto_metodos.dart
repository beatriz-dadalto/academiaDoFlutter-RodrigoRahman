class PaiProduto extends Object {
  @override
  String toString() {
    return 'origem: PaiProduto';
  }
}

class Produto extends PaiProduto {
  String nome;

  Produto(this.nome);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Produto) return false;
    return nome == other.nome;
  }

  @override
  int get hashCode => nome.hashCode;

  @override
  String toString() {
    return '${super.toString()}: | origem: classe Produto';
  }
}

void main() {
  // metodo toString() que vem da classe Object por padrão
  final p = Produto('ADF');
  print(p.toString());
  print(p.hashCode);

  //comparacao que vem da classe Object por padrão
  final p1 = Produto('ADF');
  print(p == p1);
  print(p1.hashCode);

}
