import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              SfRadialGauge(
                axes: [
                  RadialAxis(
                    showLabels: false,
                    showAxisLine: false,
                    showTicks: false,
                    minimum: 12.5,
                    maximum: 47.9,
                    ranges: [
                      ImcGaugeRange(
                        color: Colors.blue,
                        start: 12.5,
                        end: 18.5,
                        label: 'MAGREZA',
                      ),
                      ImcGaugeRange(
                        color: Colors.green,
                        start: 18.5,
                        end: 24.5,
                        label: 'NORMAL',
                      ),
                      ImcGaugeRange(
                        color: Colors.yellow,
                        start: 24.5,
                        end: 29.9,
                        label: 'SOBREPESO',
                      ),
                      ImcGaugeRange(
                        color: Colors.orange,
                        start: 29.9,
                        end: 39.9,
                        label: 'OBESIDADE',
                      ),
                      ImcGaugeRange(
                        color: Colors.red,
                        start: 39.9,
                        end: 47.9,
                        label: 'OBESIDADE GRAVE',
                      ),
                    ],
                    pointers: [
                      NeedlePointer(
                        value: 15.0,
                        enableAnimation: true,
                      ),
                    ],
                  ),
                ],
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
