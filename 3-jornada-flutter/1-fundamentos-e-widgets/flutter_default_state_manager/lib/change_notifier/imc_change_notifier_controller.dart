import 'dart:math';
import 'package:flutter/material.dart';

class ImcChangeNotifierController extends ChangeNotifier {
  var _imc = 0.0;

  double get getImc => _imc;

  Future<void> calcularIMC({
    required double peso,
    required double altura,
  }) async {
    _imc = 0;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    _imc = peso / pow(altura, 2);
    notifyListeners();
  }
}
