abstract interface class Loggable {
  void log(final String message);
}

mixin ConsoleLogger implements Loggable {
  void gravarNoConsole() {
    log('mensagem do log');
  }
}

mixin FileLogger implements Loggable {
  @override
  void log(String message) {}
}

class MonitoramentoConsole with ConsoleLogger {
  @override
  void log(String message) {
    // TODO: implement log
  }
}
