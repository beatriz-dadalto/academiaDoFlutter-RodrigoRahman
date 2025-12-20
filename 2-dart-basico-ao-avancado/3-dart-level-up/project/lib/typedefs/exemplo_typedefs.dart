/*
typedef é excelente para criar aliases (apelidos) para tipos complexos,
tornando o código mais legível e reutilizável.

Quando Usar Typedefs
✅ Use quando:

Tem tipos complexos/longos que repetem no código
Quer melhorar legibilidade de assinaturas de função
Precisa nomear tipos genéricos comuns
Trabalha com callbacks repetidos

❌ Não use quando:
O tipo é usado apenas uma vez
É um tipo simples e óbvio

EXEMPLO:
❌ Sem typedef
Map<String, List<Future<int>>> executarOperacoes() { }

✅ Com typedef
typedef Operacoes = Map<String, List<Future<int>>>;
Operacoes executarOperacoes() { }

Em resumo: Use typedef para criar apelidos legíveis para tipos complexos,
especialmente callbacks, Maps genéricos e tipos que repetem no código.
Melhora muito a legibilidade! 🎯
*/

// sem typedefs
void downloadFile(void Function(int progress) onProgress) {
  for (int i = 0; i <= 100; i += 20) {
    onProgress(i);
  }
}

// com typedefs
typedef ProgressCallback = void Function(int progress);

void downloadFileTypedefs(ProgressCallback onProgress) {
  for (int i = 0; i <= 100; i += 20) {
    onProgress(i);
  }
}

// exemplo 2 com typedefs

typedef Json = Map<String, dynamic>;

class User {
  final String name;
  final int age;
  User(this.name, this.age);

  Json toJson() => {'name': name, 'age': age};

  static User fromJson(Json json) => User(json['name'], json['age']);
}

void main() {
  downloadFile((int progress) {
    print(progress);
  });
}
