import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_default_state_manager/change_notifier/imc_change_notifier_controller.dart';
import 'package:flutter_default_state_manager/widgets/imc_gauge.dart';
import 'package:intl/intl.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class ImcChangeNotifierPage extends StatefulWidget {
  const ImcChangeNotifierPage({super.key});

  @override
  State<ImcChangeNotifierPage> createState() => _ImcChangeNotifierPageState();
}

class _ImcChangeNotifierPageState extends State<ImcChangeNotifierPage> {
  final controllerChangeNotifier = ImcChangeNotifierController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    controllerChangeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD TELA');
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Change Notifier'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: controllerChangeNotifier,
                  builder: (context, child) {
                    print('BUILD AnimatedBuilder');
                    return ImcGauge(imc: controllerChangeNotifier.getImc);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    CurrencyTextInputFormatter.currency(
                      symbol: '',
                      locale: 'pt_BR',
                      decimalDigits: 3,
                      turnOffGrouping: true,
                    ),
                  ],
                  decoration: InputDecoration(
                    labelText: 'PESO',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha o campo de peso';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    CurrencyTextInputFormatter.currency(
                      locale: 'pt_BR',
                      symbol: '',
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    ),
                  ],
                  decoration: InputDecoration(
                    labelText: 'ALTURA',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha o campo de altura';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    var formIsValid = formKey.currentState?.validate() ?? false;

                    if (formIsValid) {
                      var formatter = NumberFormat.simpleCurrency(
                        locale: 'pt_BR',
                        decimalDigits: 2,
                      );

                      double peso =
                          formatter.parse(pesoController.text) as double;
                      double altura =
                          formatter.parse(alturaController.text) as double;

                      controllerChangeNotifier.calcularIMC(
                        peso: peso,
                        altura: altura,
                      );
                    }
                  },
                  child: Text(
                    'Calcular IMC',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
