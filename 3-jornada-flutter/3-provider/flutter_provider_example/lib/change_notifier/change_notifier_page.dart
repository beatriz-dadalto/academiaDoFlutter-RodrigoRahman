import 'package:flutter/material.dart';
import 'package:flutter_provider_example/change_notifier/provider_controller.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({super.key});

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Future.delayed(Duration(seconds: 2));
        context.read<ProviderController>().alterarDados();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('---Build da ChangeNotifierPage---');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Consumer rebuilda todos widgets que estiverem escutando a classe ProviderController, por isso, prefira usar o Selector
              /*Consumer<ProviderController>(
                builder: (_, providerController, _) {
                  return CircleAvatar(
                    /*backgroundImage: NetworkImage(
                      // .watch() rebuilda a tela toda
                      context.watch<ProviderController>().imgAvatar,
                    ),*/
                    backgroundImage: NetworkImage(providerController.imgAvatar),
                    radius: 60,
                  );
                },
              ),*/
              Selector<ProviderController, String>(
                selector: (_, providerController) =>
                    providerController.imgAvatar,
                builder: (_, imgAvatar, _) {
                  print('---Build imgAvatar');
                  return CircleAvatar(
                    backgroundImage: NetworkImage(imgAvatar),
                    radius: 60.0,
                  );
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* use o Selector no lugar de Consumer para alterar apenas
                  a var que muda. o Consumer builda todos quando ocorre qualquer atualizacao*/
                  Selector<ProviderController, String>(
                    selector: (_, providerController) =>
                        providerController.name,
                    builder: (_, name, _) {
                      print('---Build name');
                      return Text(name);
                    },
                  ),
                  // Com o Tuple consigo resgatar mais de um. o Selector permite apenas 1 por vez
                  Selector<ProviderController, Tuple2<String, String>>(
                    selector: (_, providerController) =>
                        Tuple2(providerController.birthDate, providerController.name),
                    builder: (_, tuple, _) {
                      print('---Build birthDate and name');
                      return Text(' (${tuple.item1}) ${tuple.item2}');
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ProviderController>().alterarNome();
                },
                child: Text('Alterar nome'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
