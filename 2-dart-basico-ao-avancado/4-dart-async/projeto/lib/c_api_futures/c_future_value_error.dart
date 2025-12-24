/*

Future.value() cria uma Future que já está completa com um valor de
sucesso imediatamente, sem aguardar nada. É útil quando você precisa retornar
uma Future mas o valor já está disponível.

Características:
- Completa instantaneamente com um valor pré-definido
- Não aguarda nada - o valor é imediato
- Resolve na microtask queue - .then() executa na próxima iteração

*/

void main() {
  Future(() {}); // Incompleto, vai ser executado ainda

  Future.value(''); // Success

  Future.error(''); // Error

  // Future.value() = sucesso garantido
  Future.value('OK').then(print); // Imprime: OK

  // Future.error() = erro garantido
  Future.error('Falha').catchError(print); // Imprime: Falha
}

Future<String> func1() {
  // com o Future.value() Já está completa. Retorna valor já existente
  return Future.value('Qualquer valor de sucesso');
}

Future<String> func2() async {
  // com async o dart resolve pra gente
  return 'Qualquer valor de sucesso';
}
