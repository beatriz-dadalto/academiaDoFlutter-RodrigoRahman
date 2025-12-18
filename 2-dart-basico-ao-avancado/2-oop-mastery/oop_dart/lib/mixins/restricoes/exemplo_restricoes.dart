mixin MixinRestrito on SuperPoderes, MixinSuperPoderoso {
  void metodoRestrito() {
    print('Tenho super poderes');
    auditoria();
  }
}

class SuperPoderes {}

mixin MixinSuperPoderoso {
  void auditoria() {
    print('Fazendo auditoria');
  }
}

// A ordem importa! deve extender e chamar o mixin na ordem certa como está em MixinRestrito
class ClassServicoEmail extends SuperPoderes
    with MixinSuperPoderoso, MixinRestrito {}

//! ERRO pq nao extends SuperPoderes e MixinSuperPoderoso, sem eles nao funciona
//class ClassServicoSMS with MixinRestrito {}

void main() {
  final c = ClassServicoEmail();

  c.metodoRestrito();
}
