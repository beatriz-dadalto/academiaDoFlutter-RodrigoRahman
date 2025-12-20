class DiaSemanaClass {
  final String name;

  const DiaSemanaClass._(this.name);

  static const segunda = DiaSemanaClass._('segunda');
  static const terca = DiaSemanaClass._('terça');
  static const quarta = DiaSemanaClass._('quarta');
  static const quinta = DiaSemanaClass._('quinta');
  static const sexta = DiaSemanaClass._('sexta');
  static const sabado = DiaSemanaClass._('sabado');
  static const domingo = DiaSemanaClass._('domingo');
}

enum DiaDaSemana { domingo, segunda, terca, quarta, quinta, sexta, sabado }

void main() {
  //! feito com ENUM
  final diaDaSemana = DiaDaSemana.sabado;

  if (diaDaSemana == DiaDaSemana.sabado) {
    print('#Sabadou');
  }

  print(diaDaSemana.name);

  //! feito com CLASSSE
  final diaSemana = DiaSemanaClass.sexta;

  if (diaSemana == DiaSemanaClass.sexta) {
    print('#Sextou');
  }

  print(diaSemana.name);
}
