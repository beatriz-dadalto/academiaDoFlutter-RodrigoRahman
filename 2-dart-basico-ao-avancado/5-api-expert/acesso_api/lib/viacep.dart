import 'dart:convert';

import 'package:http/http.dart';

Future<void> main() async {
  final result = await get(
    Uri.parse('https://viacep.com.br/ws/01001000/json/'),
  );

  // print(result.body);
  print(result.statusCode);
  // print(result.request);
  // print(result.headers);

  if (result.statusCode != 200) {
    print('Erro ao buscar CEP');
    return;
  }

  final Map resultData = json.decode(result.body);

  if (resultData.containsKey('erro')) {
    print('CEP não existe');
  } else {
    print(resultData.runtimeType); // Map<String, dynamic>
    print(resultData['logradouro']); // Praça da Sé
  }
}
