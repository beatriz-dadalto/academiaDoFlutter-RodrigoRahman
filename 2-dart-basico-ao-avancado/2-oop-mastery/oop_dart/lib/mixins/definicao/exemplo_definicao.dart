mixin Logger {
  void log(final String mensagem) {
    print('Mensagem muit complexa de log: $mensagem');
  }
}

class Servico with Logger, Auditoria {
  void fazAlgumaTask() {
    print('algumaTask');
    log('mesagem do logger');
  }
}

// 'É' uma Auditoria 'COM' Logger
class ServicoEmail extends Armazenamento with Logger {
  void fazEnvioDoEmail() {
    print('faz o envio do email');
    log('mesagem do logger');
  }
}

mixin Auditoria {
  void auditar() {}
}

class Armazenamento {
  void armazenar() {}
}

void main() {
  // MIXIN (Logger) e MIXIN (Auditoria)
  final servico = Servico();

  // HERANÇA (Armazanamento) e MIXIN (Logger)
  final servicoEmail = ServicoEmail();

  print(servico is Auditoria); // true
  print(servicoEmail is Auditoria); // false

  print(servico is Armazenamento); // false
  print(servicoEmail is Armazenamento); // true

  final Logger logger = Servico();
  // tem apenas o metodo log()
  logger.log('mensagem');

  (logger as Servico);
  // agora tem os metodos do Logger e Servico
  logger.auditar();
  logger.fazAlgumaTask();
  logger.log('mensagemmm');
}
