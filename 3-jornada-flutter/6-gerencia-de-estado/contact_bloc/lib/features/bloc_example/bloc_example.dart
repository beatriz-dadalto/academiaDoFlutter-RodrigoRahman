import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExample extends StatefulWidget {
  const BlocExample({super.key});

  @override
  State<BlocExample> createState() => _BlocExampleState();
}

class _BlocExampleState extends State<BlocExample> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _addName() {
    final name = _nameController.text.trim();
    if (name.isNotEmpty) {
      context.read<ExampleBloc>().add(ExampleAddNameEvent(name: name));
    }
    _nameController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Example')),
      body: BlocListener<ExampleBloc, ExampleState>(
        listenWhen: (previous, current) {
          if (previous is ExampleStateInitial && current is ExampleStateData) {
            if (current.names.length > 3) {
              print(
                '--listeWhen-- rebuildou porque names.length é maior que 3',
              );
              return true;
            }
          }
          return false;
        },
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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Digite um nome',
                          border: OutlineInputBorder(),
                          labelText: 'Novo nome',
                        ),
                        onSubmitted: (value) => _addName(),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton.icon(
                      onPressed: _addName,
                      icon: const Icon(Icons.add),
                      label: const Text('Adicionar'),
                    ),
                  ],
                ),

                const SizedBox(height: 48.0),
                BlocConsumer<ExampleBloc, ExampleState>(
                  //BlocCosumer ele é listener e builder
                  listener: (context, state) {
                    print(
                      '--BlocConsumer--Estado alterado para ${state.runtimeType}--',
                    );
                  },
                  builder: (_, state) {
                    if (state is ExampleStateData) {
                      return Text(
                        'BlocConsumer | Total de nomes é ${state.names.length}',
                      );
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
                      return const Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                SizedBox(height: 24.0),
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
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        final name = names[index];
                        return ListTile(
                          onTap: () {
                            context.read<ExampleBloc>().add(
                              ExampleRemoveNameEvent(name: name),
                            );
                          },
                          title: Text(name),
                        );
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
                        physics: const NeverScrollableScrollPhysics(),
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
        ),
      ),
    );
  }
}
