import 'package:imports_dart/alias/financial_utils.dart'
    as fin
    show multiplicar, subtrair;
import 'package:imports_dart/alias/financial_utils.dart' as fin hide somar;

void main() {
  print(fin.multiplicar(12, 3));
  print(fin.subtrair(10, 3));
}
