import 'package:flutter/material.dart';

class SnackbarPage extends StatelessWidget {
  const SnackbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                const snackBar = SnackBar(
                  content: Text('Usuário salvo com sucesso'),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                // ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Simple SnackBar'),
            ),
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Usuário salvo com sucesso'),
                  backgroundColor: Colors.green,
                  action: SnackBarAction(
                    label: 'Desfazer',
                    onPressed: () {
                      print('Snackbar foi Clicado');
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Simple SnackBar'),
            ),
          ],
        ),
      ),
    );
  }
}
