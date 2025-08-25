import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_default_state_manager/bloc_pattern/imc_bloc_controller.dart';
import 'package:flutter_default_state_manager/bloc_pattern/imc_bloc_state.dart';
import 'package:flutter_default_state_manager/widgets/imc_gauge.dart';
import 'package:intl/intl.dart';

class ImcBlocPatternPage extends StatefulWidget {
  const ImcBlocPatternPage({super.key});

  @override
  State<ImcBlocPatternPage> createState() => _ImcBlocPatternPageState();
}

class _ImcBlocPatternPageState extends State<ImcBlocPatternPage> {
  final controllerImcBloc = ImcBlocController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    controllerImcBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Bloc Pattern'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                StreamBuilder<ImcBlocState>(
                  stream: controllerImcBloc.imcOut,
                  builder: (context, snapshot) {
                    var imc = snapshot.data?.imc ?? 0;
                    return ImcGauge(imc: imc);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                StreamBuilder<ImcBlocState>(
                  stream: controllerImcBloc.imcOut,
                  builder: (context, snapshot) {
                    final dataValue = snapshot.data;

                    if (dataValue is ImcBlocStateLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (dataValue is ImcBlocStateError) {
                      return Text(dataValue.message);
                    }
                    return SizedBox.shrink();
                  },
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

                      controllerImcBloc.calcularImc(peso: peso, altura: altura);
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
