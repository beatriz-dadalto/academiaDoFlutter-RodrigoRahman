/*
Em resumo: Use for elements quando precisa construir coleções dinâmicas
de forma limpa e performática.
É como um "for loop" dentro de literais! 🎯

Quando Usar For Elements
✅ Use quando:

-Precisa adicionar múltiplos elementos a uma coleção baseado em uma iteração
-Quer evitar .map() + .spread (mais legível)
-Está misturando elementos estáticos com dinâmicos
-Trabalha com listas, sets ou maps

❌ Não use quando:
Precisa de transformações complexas (use .map())
Precisa de filtros (use .where() ou if dentro do for)
*/

void main() {
  // sem FOR ELEMENTS
  final numeros = List.generate(5, (index) => index);

  final listaBatataNumeros = numeros.map<String>((e) => 'Batata $e');

  final listaBatatas = [
    'Batata Inicial',
    ...listaBatataNumeros,
    'Batata Final',
  ];

  print('Batata numeros: $listaBatataNumeros');
  print('Lista Batatas: $listaBatatas');

  // com FOR ELEMENTS

  final listaForElements = <String>[
    'Batata Inicio',
    for (final n in numeros) 'Batata $n',
    'Batata Fim',
  ];

  print('ListaForElements: $listaForElements');

  // com MAP

  final listaForElementsMAP = <String, String>{
    'I': 'Batata Inicio',
    for (final n in numeros) '$n': 'Batata $n',
    'F': 'Batata Fim',
  };

  print('ListaForElementsMAP: $listaForElementsMAP');
}
