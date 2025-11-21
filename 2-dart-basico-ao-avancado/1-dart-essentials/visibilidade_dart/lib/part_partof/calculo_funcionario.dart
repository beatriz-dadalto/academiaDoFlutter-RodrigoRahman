import 'package:visibilidade_dart/visibilidade.dart';

part 'calculo_desconto.dart';
part 'calculo_imposto.dart';

/*
  PART -> Pai/AGRUPADOR: contem todas importações
  PART OF -> Filhos: não contem importações
*/

void main() {
  calcularDesconto(200);
  _calcularImpostoRenda(200);
}
