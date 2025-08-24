import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_default_state_manager/widgets/imc_gauge.dart';
import 'package:flutter_default_state_manager/widgets/imc_gauge_range.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class ImcSetStatePage extends StatefulWidget {
  const ImcSetStatePage({super.key});

  @override
  State<ImcSetStatePage> createState() => _ImcSetStatePageState();
}

class _ImcSetStatePageState extends State<ImcSetStatePage> {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC SetState'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ImcGauge(imc: 0),
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
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Calcular IMC',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
