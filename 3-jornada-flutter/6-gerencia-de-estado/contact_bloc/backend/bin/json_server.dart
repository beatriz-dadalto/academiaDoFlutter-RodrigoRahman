import 'dart:convert';
import 'dart:io';

void main() async {
  final server = await HttpServer.bind('0.0.0.0', 3000);

  await for (final request in server) {
    final path = request.uri.path;
    final method = request.method;

    print('📥 $method $path');

    // CORS para Flutter Web/Android
    request.response.headers.add('Access-Control-Allow-Origin', '*');
    request.response.headers.add(
      'Access-Control-Allow-Methods',
      'GET, POST, PUT, DELETE, OPTIONS',
    );
    request.response.headers.add(
      'Access-Control-Allow-Headers',
      'Content-Type, Authorization',
    );

    if (method == 'OPTIONS') {
      request.response.statusCode = 200;
      await request.response.close();
      continue;
    }

    try {
      if (path == '/contacts') {
        if (method == 'GET') {
          await handleGetContacts(request);
        } else if (method == 'POST') {
          await handlePostContact(request);
        } else {
          request.response.statusCode = 405;
          await request.response.close();
        }
      } else if (path.startsWith('/contacts/')) {
        final id = path.split('/').last;
        if (method == 'GET') {
          await handleGetContact(request, id);
        } else if (method == 'PUT') {
          await handleUpdateContact(request, id);
        } else if (method == 'DELETE') {
          await handleDeleteContact(request, id);
        } else {
          request.response.statusCode = 405;
          await request.response.close();
        }
      } else {
        request.response.statusCode = 404;
        request.response.headers.contentType = ContentType.json;
        request.response.write(jsonEncode({'error': 'Not Found'}));
        await request.response.close();
      }
    } catch (e) {
      print('❌ Erro: $e');
      request.response.statusCode = 500;
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode({'error': 'Internal Server Error'}));
      await request.response.close();
    }
  }
}

Future<Map<String, dynamic>> loadDatabase() async {
  final file = File('db.json');
  if (!file.existsSync()) {
    final initialData = {'contacts': []};
    await file.writeAsString(jsonEncode(initialData));
    return initialData;
  }

  try {
    final content = await file.readAsString();
    return jsonDecode(content) as Map<String, dynamic>;
  } catch (e) {
    print('❌ Erro ao ler db.json: $e');
    final initialData = {'contacts': []};
    await file.writeAsString(jsonEncode(initialData));
    return initialData;
  }
}

Future<void> saveDatabase(Map<String, dynamic> data) async {
  final file = File('db.json');
  await file.writeAsString(jsonEncode(data));
}

// GET /contacts
Future<void> handleGetContacts(HttpRequest request) async {
  try {
    final data = await loadDatabase();
    final contacts = data['contacts'] ?? [];

    request.response.headers.contentType = ContentType.json;
    request.response.write(jsonEncode(contacts));
    print('✅ GET /contacts - Retornados ${contacts.length} contatos');
    await request.response.close();
  } catch (e) {
    print('❌ Erro GET /contacts: $e');
    request.response.statusCode = 500;
    request.response.headers.contentType = ContentType.json;
    request.response.write(jsonEncode({'error': 'Failed to get contacts'}));
    await request.response.close();
  }
}

// GET /contacts/:id
Future<void> handleGetContact(HttpRequest request, String id) async {
  try {
    final data = await loadDatabase();
    final contacts = List<Map<String, dynamic>>.from(data['contacts'] ?? []);

    final contact = contacts.firstWhere(
      (contact) => contact['id'].toString() == id,
      orElse: () => <String, dynamic>{},
    );

    if (contact.isEmpty) {
      request.response.statusCode = 404;
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode({'error': 'Contact not found'}));
    } else {
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode(contact));
      print('✅ GET /contacts/$id - Encontrado: ${contact['name']}');
    }
    await request.response.close();
  } catch (e) {
    print('❌ Erro GET /contacts/$id: $e');
    request.response.statusCode = 500;
    await request.response.close();
  }
}

// POST /contacts
Future<void> handlePostContact(HttpRequest request) async {
  try {
    final body = await utf8.decoder.bind(request).join();
    print('📦 POST body: $body');

    final newContact = jsonDecode(body) as Map<String, dynamic>;
    final data = await loadDatabase();
    final contacts = List<Map<String, dynamic>>.from(data['contacts'] ?? []);

    // Gerar ID se não existir
    if (newContact['id'] == null || newContact['id'].toString().isEmpty) {
      final maxId = contacts.isEmpty
          ? 0
          : contacts
                .map((c) => int.tryParse(c['id'].toString()) ?? 0)
                .reduce((a, b) => a > b ? a : b);
      newContact['id'] = (maxId + 1).toString();
    }

    // Adicionar timestamp
    newContact['createdAt'] = DateTime.now().toIso8601String();

    // Adicionar à lista
    contacts.add(newContact);
    data['contacts'] = contacts;

    // Salvar
    await saveDatabase(data);

    request.response.headers.contentType = ContentType.json;
    request.response.statusCode = 201;
    request.response.write(jsonEncode(newContact));
    print(
      '✅ POST /contacts - Criado: ${newContact['name']} (ID: ${newContact['id']})',
    );
    await request.response.close();
  } catch (e) {
    print('❌ Erro POST /contacts: $e');
    request.response.statusCode = 400;
    request.response.headers.contentType = ContentType.json;
    request.response.write(jsonEncode({'error': 'Bad Request: $e'}));
    await request.response.close();
  }
}

// PUT /contacts/:id
Future<void> handleUpdateContact(HttpRequest request, String id) async {
  try {
    final body = await utf8.decoder.bind(request).join();
    final updatedData = jsonDecode(body) as Map<String, dynamic>;

    final data = await loadDatabase();
    final contacts = List<Map<String, dynamic>>.from(data['contacts'] ?? []);

    final index = contacts.indexWhere(
      (contact) => contact['id'].toString() == id,
    );
    if (index == -1) {
      request.response.statusCode = 404;
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode({'error': 'Contact not found'}));
      await request.response.close();
      return;
    }

    // Manter ID e adicionar timestamp
    updatedData['id'] = id;
    updatedData['updatedAt'] = DateTime.now().toIso8601String();

    contacts[index] = updatedData;
    data['contacts'] = contacts;

    await saveDatabase(data);

    request.response.headers.contentType = ContentType.json;
    request.response.write(jsonEncode(updatedData));
    print('✅ PUT /contacts/$id - Atualizado: ${updatedData['name']}');
    await request.response.close();
  } catch (e) {
    print('❌ Erro PUT /contacts/$id: $e');
    request.response.statusCode = 400;
    await request.response.close();
  }
}

// DELETE /contacts/:id
Future<void> handleDeleteContact(HttpRequest request, String id) async {
  try {
    final data = await loadDatabase();
    final contacts = List<Map<String, dynamic>>.from(data['contacts'] ?? []);

    final initialLength = contacts.length;
    contacts.removeWhere((contact) => contact['id'].toString() == id);

    if (contacts.length == initialLength) {
      request.response.statusCode = 404;
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode({'error': 'Contact not found'}));
    } else {
      data['contacts'] = contacts;
      await saveDatabase(data);

      request.response.statusCode = 204; // No Content
      print('✅ DELETE /contacts/$id - Removido');
    }
    await request.response.close();
  } catch (e) {
    print('❌ Erro DELETE /contacts/$id: $e');
    request.response.statusCode = 400;
    await request.response.close();
  }
}
