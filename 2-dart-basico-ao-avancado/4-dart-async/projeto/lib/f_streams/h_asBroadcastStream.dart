/*


*/

Future<void> main() async {
  print('Início');

  // dados executados de tempos em tempos
  final interval = Duration(seconds: 2);

  var stream = Stream<int>.periodic(interval, callback);

  //! asBroadcastStream() é necessario para ter mais um listen()
  stream = stream.asBroadcastStream();

  stream = stream.take(10);

  //! uma stream pode ter apenas um listen()
  stream.listen((numero) {
    print('Listen 1 value: $numero');
  });

  //! para ter mais de um listen deve usar asBroadcastStream()
  stream.listen((numero) {
    print('Listen 2 value: $numero');
  });

  print('FIM...');
}

int callback(int value) {
  print('O valor da callback é $value');
  return (value + 1) * 2;
}
