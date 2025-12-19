(String, int) pessoa() {
  return ('Rodrigo', 42);
}

//! Deve ter os {} para ser nomeado
({String nome, int idade}) pessoaNomeado() {
  return (nome: 'Rodrigo', idade: 42);
}

void main() {
  final p = pessoaNomeado();
  print(p.nome);

  //! Prefira records nomeados
  (nome: 'Beatriz', dataAtualizacao: DateTime.now());

  //! Evite record de 1 parametro
  final unicoItem = ('unico',);
  unicoItem.$1;

  //! Evite misturar param nomeados com params posicionais
  (1, nome: 'Beatriz');

  //! Evite records muito grande. quando for assim eh melhor criar uma classe!
  final grande = (
    1,
    2,
    3,
    456,
    345,
    564,
    2342342,
    234,
    45354,
    342342,
    4564,
    53453,
    5465,
    3453,
    345,
    657,
    6777,
    567,
  );
}
