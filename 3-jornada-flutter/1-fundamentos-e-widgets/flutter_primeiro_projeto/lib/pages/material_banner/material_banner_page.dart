import 'package:flutter/material.dart';

class MaterialBannerPage extends StatelessWidget {
  const MaterialBannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Banner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Material Banner: aparece em cima e precisa de uma ação para ser removido
                // SnackBar: aparece embaixo e pode ter timeout automático OU precisar de ação
                var materialBanner = MaterialBanner(
                  content: const Text('Usuário salvo com sucesso'),
                  backgroundColor: Colors.green,
                  actions: [
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(
                          context,
                        ).hideCurrentMaterialBanner();
                      },
                      child: const Text('Cancelar'),
                    ),
                  ],
                );
                ScaffoldMessenger.of(
                  context,
                ).showMaterialBanner(materialBanner);
              },
              child: const Text('Simple Material Banner'),
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
