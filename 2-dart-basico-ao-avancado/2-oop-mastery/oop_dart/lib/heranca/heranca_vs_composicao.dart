class Dispositivo {
  String nome;

  Dispositivo(this.nome);

  void ligar() {
    print('Dispositivo ligado');
  }

  void desligar() {
    print('Dispositivo desligado');
  }
}

// impressora é um dispositivo
class ImpressoraFiscal extends Dispositivo {
  // heranca, altamente acoplada. alterou o pai deve alterar as classes filhas
  ImpressoraFiscal(super.nome);

  void imprimirNotaFiscal() {
    print('Nota Fiscal Impressora!');
  }
}

class ControladoraDeDispositivo {
  // Composicao, recebe um dispositivo = associação
  Dispositivo dispositivo;

  ControladoraDeDispositivo(this.dispositivo);

  void ligarDispositivo() {
    dispositivo.ligar();
  }

  void desligarDispositivo() {
    dispositivo.desligar();
  }
}

void main() {
  final impressoraFiscal = ImpressoraFiscal('Fiscal');
  // associacao: alexa (controladora) depende de impressoraFiscal (dispositivo)
  final alexa = ControladoraDeDispositivo(impressoraFiscal);

  alexa.ligarDispositivo();
}
