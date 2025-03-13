import 'package:flutter/material.dart';

class BotoesRotacaoTextoPage extends StatelessWidget {
  const BotoesRotacaoTextoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botoes Rotação Texto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.red,
                    child: const Text('Beatriz Dadalto'),
                  ),
                ),
                const Icon(Icons.ac_unit),
              ],
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                padding: const EdgeInsets.all(20),
                minimumSize: const Size(50, 10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
              ),
              child: const Text('TextButton'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.exit_to_app),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                shadowColor: Colors.blue,
                minimumSize: const Size(120, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              child: const Text('ElevatedButton'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.airplane_ticket),
              label: const Text('Modo Avião | ElevatedButton.icon()'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shadowColor: WidgetStateProperty.all(Colors.blue),
                minimumSize: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return const Size(150, 150);
                  }
                  return const Size(120, 50);
                }),
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.black;
                  } else if (states.contains(WidgetState.hovered)) {
                    return Colors.purple;
                  }
                  return Colors.amber;
                }),
              ),
              child: const Text('ElevatedButton | ButtonStyle'),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: const Text('inkwell'),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: const Text('Gesture Detector'),
              onTap: () => print('Gesture Clicado'),
              onVerticalDragStart: (_) => print('Gesture Movimentado $_'),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.green],
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  print('cliquei no botao container');
                },
                child: const Center(
                  child: Text('Meu botão container'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
