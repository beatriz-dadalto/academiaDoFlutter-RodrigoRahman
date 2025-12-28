import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;

  Telefone({required this.ddd, required this.telefone});

  /*
    ! Processo de Serialização em 2 etapas:
    Primeiro: transforma obj em map -> toMap()
    Segundo: de map para string json -> toJson()
  */

  //! De obj Telefone para Map<String, dynamic>
  //! Lembre-se: a chave de ser escrita igual, identica a forma como esta na API
  Map<String, dynamic> toMap() {
    return {'ddd': ddd, 'telefone': telefone};
  }

  //! De Map<String, dynamic> para json por meio do pacote dart:convert (jsonEnconde)
  String toJson() => jsonEncode(toMap());

  /*
    ! Processo de Desserializacao em 2 etapas:
    Primeiro: json para map
    Segundo: de map para obj Telefone
  */

  // etapa 2 da desserialização
  //! Lembre-se de fazer validacao porque pode vir null da API
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(ddd: map['ddd'] ?? 0, telefone: map['telefone'] ?? '');
  }

  // etapa 1 da desserialização
  factory Telefone.fromJson(String json) => Telefone.fromMap(jsonDecode(json));
}
