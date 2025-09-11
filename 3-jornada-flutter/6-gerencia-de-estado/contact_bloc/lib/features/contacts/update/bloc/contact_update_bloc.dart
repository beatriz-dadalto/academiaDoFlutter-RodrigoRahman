import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_update_bloc.freezed.dart';
part 'contact_update_event.dart';
part 'contact_update_state.dart';

class ContactUpdateBloc extends Bloc<ContactUpdateEvent, ContactUpdateState> {
  final ContactsRepository _repository;
  ContactUpdateBloc({
    required ContactsRepository repository,
  }) : _repository = repository,
       super(const ContactUpdateState.initial()) {
    on<_Save>(_save);
  }

  FutureOr<void> _save(_Save event, Emitter<ContactUpdateState> emit) async {
    try {
      emit(ContactUpdateState.loading());
      final model = ContactModel(
        id: event.id,
        name: event.name,
        email: event.email,
      );
      await _repository.update(model);
      emit(ContactUpdateState.success());
    } on Exception catch (e, s) {
      log('Erro ao atualizar o contato', error: e, stackTrace: s);
      emit(ContactUpdateState.error(message: 'Erro ao atualizar contato'));
    }
  }
}
