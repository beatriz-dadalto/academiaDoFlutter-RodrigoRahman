import 'package:contact_bloc/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactsRepository {
  final baseUrl = 'http://10.0.2.2:3000';
  late final Dio _dio;

  ContactsRepository() {
    _dio = Dio();
  }

  Future<List<ContactModel>> findAll() async {
    try {
      final response = await _dio.get('$baseUrl/contacts');

      return (response.data as List)
          .map((contact) => ContactModel.fromMap(contact))
          .toList();
    } on DioError catch (e) {
      throw Exception('Erro ${e.message}');
    } catch (e) {
      throw Exception('Erro inesperado: $e');
    }
  }

  Future<void> create(ContactModel model) async {
    try {
      await _dio.post('$baseUrl/contacts', data: model.toMap());
    } on DioError catch (e) {
      final message = switch (e.type) {
        DioErrorType.connectTimeout => 'Timeout de conexão',
        DioErrorType.sendTimeout => 'Timeout no envio',
        DioErrorType.receiveTimeout => 'Timeout na resposta',
        DioErrorType.response => 'Erro ${e.response?.statusCode}',
        DioErrorType.cancel => 'Requisição cancelada',
        _ => 'Erro de rede: ${e.message}',
      };
      throw Exception(message);
    } catch (e) {
      throw Exception('Erro inesperado: $e');
    }
  }

  Future<void> update(ContactModel model) async {
    try {
      await _dio.put('$baseUrl/contacts/${model.id}', data: model.toMap());
    } catch (e) {
      throw Exception('Erro inesperado: $e');
    }
  }

  Future<void> delete(ContactModel model) async {
    try {
      await _dio.delete('$baseUrl/contacts/${model.id}');
    } catch (e) {
      throw Exception('Erro inesperado: $e');
    }
  }
}
