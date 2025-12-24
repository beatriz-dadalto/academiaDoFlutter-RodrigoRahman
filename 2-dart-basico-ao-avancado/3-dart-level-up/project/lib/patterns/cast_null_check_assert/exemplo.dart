//! Padrões Unários: Cast (as), Null-check (?), Assert (!)
void objectCast(Object objeto) {
  if (objeto is String) {
    if (objeto == 'Beatriz') {}
  }

  if (objeto case String n when n == 'Beatriz') {
    print('N: $n é Beatriz');
  }
}

void nullChecked((String? nome, int? idade) record) {
  switch (record) {
    case (final var1?, final var2?):
      print('switch: Ambos são diferentes de null ($var1, $var2)');
    case (final var1?, _):
      print('switch: Idade é nula ($var1)');
    case _:
      print('switch: Ambos são null');
  }

  if (record case (final nome?, final idade?)) {
    print('if case: Ambos são diferentes de null ($nome, $idade)');
  }

  // if normal seria assim
  if (record.$1 != null && record.$2 != null) {
    print(
      'if normal: Ambos são diferentes de null (${record.$1!}, ${record.$2!})',
    );
  }
}

void listaNomesNullChecked(List<String?> nomes) {
  for (final nome in nomes) {
    switch (nome) {
      case final n?:
        print('lista: nome não nulo $n');
      case _:
        print('lista: nome é nulo');
    }
  }
}

//! Não recomendado porque estoura exception. no lugar de ! use ?
void nullAssert(List<String?> row) {
  switch (row) {
    case ['user', final name!]: // exception se vier null por causa do !
      print('nome usuário: $name');
    case _:
      print('No match');
  }
}

void main() {
  nullChecked(('Beatriz', 10)); // Ambos são diferentes de null (Beatriz, 10)
  nullChecked(('Beatriz', null));
  nullChecked((null, null));

  listaNomesNullChecked(['Beatriz', null, 'Dadalto']);

  nullAssert(['user', 'Beatriz']);
  nullAssert(['user', null]); //!estoura Exception
}
