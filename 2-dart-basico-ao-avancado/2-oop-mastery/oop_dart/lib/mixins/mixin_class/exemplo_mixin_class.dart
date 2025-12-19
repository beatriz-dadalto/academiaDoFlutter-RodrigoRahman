mixin class Auditoria {
  //! se quiser usar a class como MIXIN nao pode ter construtor com parametros
  Auditoria.nomeado();
  Auditoria();

  void auditar() {
    print('audidantando');
  }
}

class Servico extends Auditoria {
  Servico() : super.nomeado();
}

class Servico2 with Auditoria {}

void main() {
  final auditoria = Auditoria.nomeado();
}
