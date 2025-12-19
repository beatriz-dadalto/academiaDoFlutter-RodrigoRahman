/*
Características extension method:

Estende tipo existente
Sem type-checking
Mais flexível
*/
extension CelsiusMethod on double {}

// extension type: definimos pelo tipo do construtor.
// estamos criando um tipo personalizado que vai se comportar como double
/*
Características:

Cria um tipo novo e distinto
Validações automáticas
Type-safe (previne erros)
Melhor performance (compile-time)
*/
extension type Celsius(double valor) implements double {
  double toFahrenheit() => (valor * 9 / 5) + 32;
}

void main() {
  final temperatura = Celsius(25.0);

  final List<double> temperaturas = [30.0, 15.5, temperatura];
}
