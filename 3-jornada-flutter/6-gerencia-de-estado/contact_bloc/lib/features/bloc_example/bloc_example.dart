import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExample extends StatelessWidget {
  const BlocExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Example')),
      body: BlocListener<ExampleBloc, ExampleState>(
        listener: (context, state) {
          //executa aqui apenas quando o estado muda.
          print('-----Estado foi alterado!----BlocListener');
          if (state is ExampleStateData) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('A quantidade de nomes é ${state.names.length}'),
              ),
            );
          }
        },
        child: Column(
          children: [
            BlocConsumer<ExampleBloc, ExampleState>(
              //BlocCosumer ele é listener e builder
              listener: (context, state) {
                print(
                  '--BlocConsumer--Estado alterado para ${state.runtimeType}--',
                );
              },
              builder: (_, state) {
                if (state is ExampleStateData) {
                  return Text('BlocConsumer | Total de nomes é ${state.names.length}');
                }
                return const SizedBox.shrink();
              },
            ),
            BlocSelector<ExampleBloc, ExampleState, bool>(
              selector: (state) {
                if (state is ExampleStateInitial) {
                  return true;
                }
                return false;
              },
              builder: (context, showLoader) {
                if (showLoader) {
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            SizedBox(height: 24.0,),
            Text('Bloc Selector'),
            BlocSelector<ExampleBloc, ExampleState, List<String>>(
              selector: (state) {
                if (state is ExampleStateData) {
                  return state.names;
                }
                return [];
              },
              builder: (context, names) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    final name = names[index];
                    return ListTile(title: Text(name));
                  },
                );
              },
            ),
            Text('Bloc Builder'),
            BlocBuilder<ExampleBloc, ExampleState>(
              builder: (context, state) {
                print('--Olha--${state.runtimeType}--Aqui--');
                if (state is ExampleStateData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.names.length,
                    itemBuilder: (context, index) {
                      final name = state.names[index];
                      return ListTile(title: Text(name));
                    },
                  );
                }
                return Text('Nenhum nome cadastrado.');
              },
            ),
          ],
        ),
      ),
    );
  }
}
