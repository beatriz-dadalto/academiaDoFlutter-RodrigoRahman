import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial()) {
    on<ExampleFindNameEvent>(_findNames);
    on<ExampleRemoveNameEvent>(_removeName);
    on<ExampleAddNameEvent>(_addName);
  }

  FutureOr<void> _addName(
    ExampleAddNameEvent event,
    Emitter<ExampleState> emit,
  ) {
    final stateExample = state;

    if (stateExample is ExampleStateData) {
      final names = [...stateExample.names]; // Copia a lista atual
      names.add(event.name); // Adiciona o novo nome
      emit(ExampleStateData(names: names)); // Emite o novo estado
    } else {
      // Se não há lista ainda, cria uma nova com o primeiro nome
      emit(ExampleStateData(names: [event.name]));
    }
  }

  FutureOr<void> _removeName(
    ExampleRemoveNameEvent event,
    Emitter<ExampleState> emit,
  ) {
    final stateExample = state;

    if (stateExample is ExampleStateData) {
      final names = [...stateExample.names]; //spread para copiar a lista
      names.retainWhere(
        (element) => element != event.name,
      ); //quando clicar num item da lista vai remover
      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _findNames(
    ExampleFindNameEvent event,
    Emitter<ExampleState> emit,
  ) async {
    final names = [
      'Beatriz Dadalto',
      'Academia do Flutter',
      'Flutter',
      'Dart',
      'Flutter Bloc',
    ];
    await Future.delayed(Duration(seconds: 4));
    emit(ExampleStateData(names: names));
  }
}
