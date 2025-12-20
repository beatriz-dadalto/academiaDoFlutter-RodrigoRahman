import 'dart:collection';

base class Item extends LinkedListEntry<Item> {
  final int value;
  Item(this.value);

  @override
  String toString() {
    return '$value';
  }
}

void main() {
  final linkedList = LinkedList<Item>();
  linkedList.add(Item(1));
  linkedList.add(Item(2));
  linkedList.add(Item(3));
  linkedList.add(Item(4));
  linkedList.add(Item(5));

  // nao da pra acessar pelo index
  for (final num in linkedList) {
    print(num);
  }

  // remove paenas pela referencia da memoria. encontre primeiro a referencia!
  final itemToRemove = linkedList.firstWhere((element) => element.value == 5);
  linkedList.remove(itemToRemove);
}
