import 'dart:convert';

class Cidade {
  final String cidade;
  final String estado;
  Cidade({
    required this.cidade,
    required this.estado,
  });

  Cidade copyWith({
    String? cidade,
    String? estado,
  }) {
    return Cidade(
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cidade': cidade,
      'estado': estado,
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      cidade: map['cidade'] ?? '',
      estado: map['estado'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Cidade.fromJson(String source) => Cidade.fromMap(json.decode(source));

  @override
  String toString() => 'Cidade(cidade: $cidade, estado: $estado)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cidade &&
      other.cidade == cidade &&
      other.estado == estado;
  }

  @override
  int get hashCode => cidade.hashCode ^ estado.hashCode;
}
