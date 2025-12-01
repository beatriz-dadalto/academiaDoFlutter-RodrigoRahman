import 'package:oop_dart/modificadores/base/base_exemplo.dart';

// base pode ser extends mas nao pode ser implements fora da library/file
base class Barco extends Veiculo {
  Barco({required super.marca, required super.modelo});
}
