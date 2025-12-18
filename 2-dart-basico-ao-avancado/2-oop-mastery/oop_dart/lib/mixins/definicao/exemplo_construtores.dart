mixin Logger {
  String _prefix = 'LOG';

  void log(final String mensagem) {
    print('$_prefix: Mensagem muito complexa de log: $mensagem');
  }
}

class Servico with Logger {
  Servico() {
    _prefix = 'Serviço X';
  }

  void task() {
    log('Logando algo');
  }
}

void main() {
  final s = Servico();

  s.task();
}
