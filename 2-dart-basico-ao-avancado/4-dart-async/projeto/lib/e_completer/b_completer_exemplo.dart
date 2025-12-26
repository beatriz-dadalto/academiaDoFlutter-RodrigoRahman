import 'dart:async';

Future<void> main() async {
  final usuario = UsuarioRepository();

  // por meio de callback
  usuario.salvarComum(
    (callbackSuccess) {
      print('SUcesso $callbackSuccess');
    },
    (callbackError) {
      print('Error: $callbackError');
    },
  );

  // com async await e completer
  try {
    final sucesso = await usuario.salvarCompleter();
    print('Sucesso completer $sucesso');
  } catch (e, s) {
    print('Erro completer: $e');
    print(s);
  }
}

class UsuarioRepository {
  // por meio de callback
  void salvarComum(
    void Function(String) callbackSuccess,
    void Function(String) callbackError,
  ) {
    Timer(Duration(seconds: 2), () {
      try {
        throw Exception();
        callbackSuccess('Usuario salvo com sucesso');
      } catch (e, s) {
        callbackError('Erro $e');
        print(s);
      }
    });
  }

  // com completer, sem callback
  Future<String> salvarCompleter() {
    final completer = Completer<String>();

    Timer(Duration(seconds: 2), () {
      try {
        completer.complete('usuário salvo com sucesso');
      } catch (e) {
        completer.completeError('Error: $e');
      }
    });

    return completer.future;
  }
}
