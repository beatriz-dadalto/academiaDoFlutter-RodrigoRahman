import 'dart:convert';
import 'dart:developer';

import 'package:consumo_api_alunos/models/aluno.dart';
import 'package:http/http.dart' as http;

class AlunoRepository {
  Future<List<Aluno>> buscarTodos() async {
    final alunosResponse = await http.get(
      Uri.parse('http://localhost:8080/alunos'),
    );

    print('DEBUG: ${alunosResponse.body}'); // List<Map<String, dynamic>>

    final alunosList =
        jsonDecode(alunosResponse.body) as List;

    final alunos = alunosList
        .map<Aluno>((alunoMap) => Aluno.fromMap(alunoMap))
        .toList();

    return alunos;
  }

  Future<Aluno> buscarPorId(int id) async {
    final alunoResponse = await http.get(
      Uri.parse('http://localhost:8080/alunos/$id'),
    );

    return Aluno.fromJson(alunoResponse.body);
  }
}
