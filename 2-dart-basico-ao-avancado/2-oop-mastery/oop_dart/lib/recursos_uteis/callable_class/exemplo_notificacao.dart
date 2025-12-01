class Notificador {
  final String remetente;

  Notificador(this.remetente);

  void call(final String destinatario, final String tipoNotificacao) {
    final String mensagem;

    switch (tipoNotificacao.toLowerCase()) {
      case 'email':
        mensagem = 'Você recebeu um e-mail de $remetente';
        break;
      case 'sms':
        mensagem = 'Você recebeu um sms de $remetente';
        break;
      case 'push':
        mensagem = 'Você recebeu um push notification de $remetente';
        break;
      default:
        mensagem = 'Tipo de notificação desconhecida.';
        break;
    }

    print('Para: $destinatario');
    print('Mensagem: $mensagem');
  }
}

void main() {
  final notificadores = [Notificador('Sistema A'), Notificador('Sistema B')];

  for (var notificador in notificadores) {
    notificador('Usuário', 'email');
    notificador('Usuário', 'push');
  }
}
