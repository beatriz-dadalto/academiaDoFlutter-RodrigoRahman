import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_register_bloc.freezed.dart';
part 'contact_register_event.dart';
part 'contact_register_state.dart';

class ContactRegisterBloc
    extends Bloc<ContactRegisterEvent, ContactRegisterState> {
  final ContactsRepository _repository;

  ContactRegisterBloc({required ContactsRepository repository})
    : _repository = repository,
      super(const ContactRegisterState.initial()) {
    on<ContactRegisterEventSave>(_save);
  }

  FutureOr<void> _save(
    ContactRegisterEventSave event,
    Emitter<ContactRegisterState> emit,
  ) async {
    try {
      emit(ContactRegisterState.loading());
      await Future.delayed(Duration(seconds: 2));
      final contactModel = ContactModel(name: event.name, email: event.email);
      
      await _repository.create(contactModel);
      emit(ContactRegisterState.success());
    } catch (e, stackTrace) {
      log('Erro ao salvar um novo usuário', error: e, stackTrace: stackTrace);
      emit(ContactRegisterState.error(message: 'Erro ao salvar contato!'));
    }
  }
}
