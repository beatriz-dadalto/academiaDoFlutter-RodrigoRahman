import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String name = 'Hayley Williams';
  String imgAvatar =
      'https://uploads.emaisgoias.com.br/2020/01/hayley-williams-solo-simmer.jpg';
  String birthDate = '27/12/1988';

  void alterarDados() {
    name = 'Hayley - Paramore';
    imgAvatar =
        'https://upload.wikimedia.org/wikipedia/commons/7/7d/Paramore_Hayley_Williams03_cropped.jpg';
    birthDate = '1988/12/27';
    notifyListeners();
  }

  void alterarNome() {
    name = 'Cantora';
    notifyListeners();
  }
}
