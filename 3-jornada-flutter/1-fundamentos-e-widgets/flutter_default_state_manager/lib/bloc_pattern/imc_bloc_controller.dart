import 'dart:async';
import 'dart:math';

import 'package:flutter_default_state_manager/bloc_pattern/imc_bloc_state.dart';

class ImcBlocController {
  final _imcStreamController = StreamController<ImcBlocState>.broadcast()
    ..add(ImcBlocState(imc: 0.0));

  Stream<ImcBlocState> get imcOut => _imcStreamController.stream;
  // Sink<ImcBlocState> get imcIn => _imcStreamController.sink;

  Future<void> calcularImc({
    required double peso,
    required double altura,
  }) async {
    final imc = 0.0;
    try {
      _imcStreamController.add(ImcBlocStateLoading());
      await Future.delayed(Duration(seconds: 1));
      final imc = peso / pow(altura, 2);
      _imcStreamController.add(ImcBlocState(imc: imc));
    } on Exception {
      _imcStreamController.add(
        ImcBlocStateError(message: 'Erro ao calcular IMC', imc: imc),
      );
    }
  }

  void dispose() {
    _imcStreamController.close();
  }
}
