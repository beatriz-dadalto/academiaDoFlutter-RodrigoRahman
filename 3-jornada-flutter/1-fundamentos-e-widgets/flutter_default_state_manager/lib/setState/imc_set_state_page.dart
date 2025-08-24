import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_default_state_manager/widgets/imc_gauge.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/intl.dart';

class ImcSetStatePage extends StatefulWidget {
  const ImcSetStatePage({super.key});

  @override
  State<ImcSetStatePage> createState() => _ImcSetStatePageState();
}

class _ImcSetStatePageState extends State<ImcSetStatePage> {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var imc = 0.0;

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  Future<void> _calcularIMC({
    required double peso,
    required double altura,
  }) async {
    setState(() {
      imc = 0;
    });

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      imc = peso / pow(altura, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC SetState'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ImcGauge(imc: imc),
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

                      _calcularIMC(peso: peso, altura: altura);
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
