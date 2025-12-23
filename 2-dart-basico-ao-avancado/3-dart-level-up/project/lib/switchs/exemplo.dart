void main() {
  final command = 'OPEN';

  switch (command) {
    case 'OPEN':
      print('Executando comando OPEN');
      continue newCase; //! label newCase é como se fosse um continue
    case 'DENIED':
    case 'CLOSED':
      print('Executando comando Denied ou Closed');
    newCase:
    case 'PENDING':
      print('Executando comando PENDING');
    default:
      print('Comando desconhecido');
  }

  final diaDasemana = 3;

  //! swicth para retornar valores. vai ter uma expressão com => e nao tem case
  final nomeDoDia = switch (diaDasemana) {
    1 => 'Segunda-feira',
    2 => 'Terça-feira',
    3 => 'Quarta-feira',
    4 => 'Quinta-feira',
    5 => 'Sexta-feira',
    6 => 'Sábado',
    7 => 'Domingo',
    _ => 'Dia inválido',
  };

  print('O dia da semana é $nomeDoDia');

  final conceito = calcularNota(85);
  print('O conceito da nota é: $conceito');
}

String calcularNota(int nota) {
  return switch (nota) {
    >= 90 => 'A',
    >= 80 && < 90 => 'B',
    >= 70 && < 80 => 'C',
    >= 60 && < 70 => 'D',
    < 60 => 'F',
    _ => 'Nota inválida',
  };
}
