//!arquivos com PART nao pode ter OUTROS imports!
// se precisar importar vc deve importar no arquivo PAI/AGRUPADOR

part of 'calculo_funcionario.dart';

// exemplo mais concreto: Funcao para calcular o desconto em uma compra
String calcularDesconto(double valorAdiantamento) {
  funcaoGlobal(); // <- foi importado no PAI/AGRUPADOR
  if (valorAdiantamento >= 1000) {
    return 'Desconto de 10% aplicado';
  } else {
    return 'Sem desconto';
  }
}
