import 'dart:convert';

import 'package:consumo_api_alunos/models/cidade.dart';
import 'package:consumo_api_alunos/models/telefone.dart';

class Endereco {
  String rua;
  int numero;
  String cep;
  Cidade cidade;
  Telefone telefone;

  Endereco({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.cidade,
    required this.telefone,
  });
  // serialização
  //! De obj para Map<String, dynamic>
  //! Lembre-se: a chave de ser escrita igual, identica a forma como está na API
  Map<String, dynamic> toMap() {
    return {
      'rua': rua,
      'numero': numero,
      'CEP': cep, //! chave maiusculo igual está escrito na API
      'cidade': cidade.toMap(),
      'telefone': telefone.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());
  //Desserialização
  //! Lembre-se de fazer validacao porque pode vir null da API
  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? 0,
      cep: map['CEP'] ?? '', //! chave maiusculo igual está escrito na API
      cidade: Cidade.fromMap(map['cidade'] ?? <String, dynamic>{}),
      telefone: Telefone.fromMap(map['telefone'] ?? <String, dynamic>{}),
    );
  }

  factory Endereco.fromJson(String json) => Endereco.fromMap(jsonDecode(json));
}
