//! Null Aware Elements existe a partir da versão 3.8

String? nome;
String? sobrenome;

String? chaveOptional;
String? valorOptional;

void main() {
  var listaNomes1 = <String>[
    'Anny',
    'Bia',
    'Coração',
    'Delicadeza',
    nome ?? '',
  ];
  var listaNomes2 = <String>[
    'Anny',
    'Bia',
    'Coração',
    'Delicadeza',
    if (nome != null) nome!,
  ];

  // com Null Aware Element: verifica se é null
  var listaNomes3 = <String>['Anny', 'Bia', 'Coração', 'Delicadeza', ?nome];

  print('listaNome3: $listaNomes3');

  final mapa = <String, String>{
    'chave1': 'valor1',
    ?chaveOptional: 'valor33', // se for null não adiciona a linha
    'chave3': ?valorOptional, // se for null não adiciona a linha
    'chave2': 'valor2',
  };

  print(mapa);
}
