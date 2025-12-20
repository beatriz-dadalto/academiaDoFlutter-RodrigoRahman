import 'dart:collection';

void main() {
  // mesma coisa que o Queue, mas mais eficiente
  final lista = DoubleLinkedQueue<int>.from([1, 2, 3, 4, 5]);

  // FIFO e LIFO
  lista.removeLast(); // remove o 5

  print(lista);

  lista.removeFirst(); // remove o 1

  print(lista);
}
