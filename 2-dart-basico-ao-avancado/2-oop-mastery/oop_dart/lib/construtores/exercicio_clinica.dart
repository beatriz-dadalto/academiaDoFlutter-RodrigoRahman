class Paciente {
  final String nome;
  final int idade;
  final String telefone;

  Paciente(this.nome, this.idade, this.telefone);

  // Design pattern PROTOTYPE
  Paciente copyWith({String? nome, int? idade, String? telefone}) {
    return Paciente(
      nome ?? this.nome,
      idade ?? this.idade,
      telefone ?? this.telefone,
    );
  }

  Paciente atualizarTelefone(String novoTelefone) {
    return copyWith(telefone: novoTelefone);
  }

  void exibirDados() {
    print('Nome: $nome, idade: $idade, telefone: $telefone');
  }

  @override
  String toString() => 'nome: $nome, idade: $idade, telefone: $telefone';
}

class Consulta {
  final Paciente paciente;
  DateTime data;
  final String especialidade;

  Consulta(this.paciente, this.data, this.especialidade);

  // Design pattern PROTOTYPE
  Consulta copyWith({
    Paciente? paciente,
    DateTime? data,
    String? especialidade,
  }) {
    return Consulta(
      paciente ?? this.paciente,
      data ?? this.data,
      especialidade ?? this.especialidade,
    );
  }

  Consulta remarcarConsulta(DateTime novaData) {
    return copyWith(data: novaData);
  }

  void exibirDetalhes() {
    print('Paciente: $paciente, Data: $data, Especialidade: $especialidade');
  }
}

void main() {
  final paciente = Paciente('Lord Miuxo', 18, '11999999999');

  paciente.exibirDados();
  final pacienteAlterado = paciente.atualizarTelefone('11977777777');
  pacienteAlterado.exibirDados();
  final consulta = Consulta(pacienteAlterado, DateTime.now(), 'Nutricionista');
  consulta.exibirDetalhes();
  final novaConsulta = consulta.remarcarConsulta(DateTime.now());
  novaConsulta.exibirDetalhes();
}
