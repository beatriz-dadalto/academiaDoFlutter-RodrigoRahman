import 'dart:convert';

void main() {
  //! chave do json sempre em "" aspas dupla.
  final jsonCEP = '''
  {
      "cep": "01001-000",
      "logradouro": "Praça da Sé",
      "complemento": "lado ímpar",
      "unidade": "",
      "bairro": "Sé",
      "localidade": "São Paulo",
      "uf": "SP",
      "estado": "São Paulo",
      "regiao": "Sudeste",
      "ibge": "3550308",
      "gia": "1004",
      "ddd": "11",
      "siafi": "7107"
    }
  ''';

  //! converter em obj Dart do tipo Map<String, dynamic>
  final jsonData = json.decode(jsonCEP);

  print(jsonData['logradouro']); // Praça da Sé

  //! converter obj dart para json
  final jsonMap = {"curso": 'Academia do flutter', "totalAlunos": 880};

  print(json.encode(jsonMap)); // String json -> {"curso":"Academia do flutter","totalAlunos":880}
}
