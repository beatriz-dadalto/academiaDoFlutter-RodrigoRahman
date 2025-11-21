void main() {
  var list = <String>['Beatriz', 'Dadalto', 'ADF'];
  print(list[1]); // Dadalto
  list.add('ADF novo');
  print(list); // [Beatriz, Dadalto, ADF, ADF novo]

  print(list.first);
  print(list.last);

  // adicionar uma lista dentro de outra
  final cursos = ['Dart Essentials', 'POO', 'Level UP'];
  list.addAll(cursos);
  print(
    list,
  ); // [Beatriz, Dadalto, ADF, ADF novo, Dart Essentials, POO, Level UP]

  final conseguiuRemover = list.remove('POO');
  print(conseguiuRemover); // true

  final itemRemovido = list.removeAt(5);
  print(itemRemovido); // Level UP
}
