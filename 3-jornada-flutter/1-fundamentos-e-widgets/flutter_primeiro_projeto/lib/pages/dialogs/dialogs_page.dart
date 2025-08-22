import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/pages/dialogs/dialog_custom.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogs Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return DialogCustom(context);
                  },
                  barrierDismissible: false,
                );
              },
              child: const Text('Dialog'),
            ),
            ElevatedButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text('Simple Dialog'),
                      contentPadding: const EdgeInsets.all(10.0),
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Titulo X'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Fechar Dialog'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('SimpleDialog'),
            ),
            ElevatedButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Alert Dialog'),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Deseja realmente salvar?'),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Confirmar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Alert Dialog'),
            ),
            ElevatedButton(
              onPressed: () async {
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                print('O horário selecionado foi $selectedTime');
              },
              child: const Text('Time Picker'),
            ),
            ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2029),
                );
                print('O horário selecionado foi $selectedDate');
              },
              child: const Text('Date Picker'),
            ),
            ElevatedButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationIcon: Icon(Icons.flutter_dash),
                );
              },
              child: const Text('About Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
