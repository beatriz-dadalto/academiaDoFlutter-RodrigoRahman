# O que é paralelismo, concorrência e multithreading? em flutter

Paralelismo, Concorrência e Multithreading em Flutter

Ótima pergunta, Beatriz! Essas são três conceitos que frequentemente geram confusão, então vou detalhar bem cada um:

## Concorrência

É a capacidade de um programa lidar com múltiplas tarefas alternando entre elas. Não necessariamente executando ao mesmo tempo, mas intercalando a execução. Em Flutter/Dart, isso é feito principalmente com Futures e async/await. A ideia é: enquanto uma tarefa aguarda algo (como uma requisição HTTP), o programa pode fazer outra coisa.

Dart
Copiar
Future<void> buscarDados() async {
  print('Iniciando busca...');
  await Future.delayed(Duration(seconds: 2));
  print('Dados recebidos!');
}

## Paralelismo

É quando as tarefas executam literalmente ao mesmo tempo em múltiplos processadores/núcleos. Isso é diferente de concorrência! Enquanto concorrência é sobre gerenciar múltiplas tarefas, paralelismo é sobre executar múltiplas tarefas simultaneamente.

## Multithreading

É o mecanismo técnico de usar múltiplas threads (linhas de execução) para alcançar paralelismo ou concorrência. Uma thread é basicamente um "caminho de execução" independente.

### Em Flutter/Dart, como funciona na prática?

Dart é single-threaded por padrão! Isso significa que o código Dart executa em uma única thread. Mas você pode usar:

- async/await → Concorrência (a forma mais comum)
- Isolates → Verdadeiro paralelismo (cria threads separadas)
Dart
Copiar
// Concorrência com async/await
Future<void> exemplo1() async {
  print('Tarefa 1');
  await Future.delayed(Duration(seconds: 1));
  print('Tarefa 1 completa');
}

```
// Paralelismo com Isolates

import 'dart:isolate';

void tarefa2() {
  print('Executando em thread separada');
}

void main() async {
  await Isolate.spawn(tarefa2, null);
}
```

A diferença prática: async/await é mais leve e suficiente para a maioria dos casos (requisições, animações, etc). Isolates você usa quando tem cálculos pesados que realmente precisam rodar em paralelo sem bloquear a UI.

# O que é e para que serve a programação semáforo?

Programação Semáforo

Ótima pergunta, Beatriz! Esse é um conceito importante de sincronização entre threads, especialmente relevante quando você está estudando concorrência e multithreading.

O que é?

Um semáforo é uma estrutura de dados (ou mecanismo) que controla o acesso a recursos compartilhados entre múltiplas threads. Ele funciona como um "guarda" que permite ou bloqueia o acesso baseado em um contador.

Pense em um semáforo de trânsito: ele controla quantos carros podem passar por vez. Um semáforo de programação faz algo parecido com threads.

## Como funciona?

### Um semáforo tem:

Um contador (geralmente começa em 1 ou N)
Duas operações principais:
wait() ou acquire() → Diminui o contador. Se for 0, a thread espera
signal() ou release() → Aumenta o contador, liberando uma thread esperando
Semáforo = 1 (disponível)

Thread A chama wait()  →  Semáforo = 0 (bloqueado para outros)
Thread B chama wait()  →  Espera... (bloqueada)
Thread A chama signal() → Semáforo = 1 (libera Thread B)
Thread B entra         →  Semáforo = 0 (bloqueado novamente)

### Para que serve?
1. Exclusão Mútua (Mutex)

Garante que apenas uma thread acesse um recurso por vez:

Dart
Copiar
// Exemplo conceitual (Dart não tem semáforos nativos, mas a ideia é essa)
Semaforo mutex = Semaforo(1);

void acessarRecursoCompartilhado() {
  mutex.wait();  // Aguarda se outro estiver usando

  // Código crítico - apenas uma thread por vez
  print('Acessando recurso...');

  mutex.signal();  // Libera para próxima thread
}

2. Controle de Múltiplos Acessos

Permite que N threads acessem um recurso simultaneamente:

Dart
Copiar
// Semáforo com contador = 3
// Permite que até 3 threads acessem ao mesmo tempo
Semaforo pool = Semaforo(3);

void acessarPoolDeConexoes() {
  pool.wait();  // Uma das 3 "vagas"

  // Usa conexão do pool
  print('Usando conexão...');

  pool.signal();  // Libera vaga
}

## Em Flutter/Dart, como você usa?

Dart não tem semáforos nativos, mas você consegue implementar o conceito com:

Dart
Copiar
// Usando Completer para simular semáforo
class Semaforo {
  int _contador;
  final List<Completer<void>> _fila = [];

  Semaforo(this._contador);

  Future<void> wait() async {
    if (_contador > 0) {
      _contador--;
    } else {
      final completer = Completer<void>();
      _fila.add(completer);
      await completer.future;
    }
  }

  void signal() {
    if (_fila.isNotEmpty) {
      _fila.removeAt(0).complete();
    } else {
      _contador++;
    }
  }
}

Exemplo prático: Limitando requisições simultâneas
Dart
Copiar
final semaforo = Semaforo(3); // Máximo 3 requisições por vez

Future<void> fazerRequisicao(String url) async {
  await semaforo.wait();

  try {
    print('Fazendo requisição para $url');
    await Future.delayed(Duration(seconds: 2));
    print('Requisição concluída: $url');
  } finally {
    semaforo.signal(); // Sempre libera, mesmo com erro
  }
}

void main() async {
  // Tenta fazer 10 requisições, mas apenas 3 por vez
  for (int i = 0; i < 10; i++) {
    fazerRequisicao('url_$i');
  }
}

## Quando você vai usar isso?
- Proteção de dados compartilhados entre threads
- Limitação de conexões (pool de conexões com BD)
- Rate limiting de requisições
- Controle de acesso a recursos limitados
