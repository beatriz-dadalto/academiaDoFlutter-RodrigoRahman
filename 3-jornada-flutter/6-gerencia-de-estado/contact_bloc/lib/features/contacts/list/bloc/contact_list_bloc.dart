import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_list_bloc.freezed.dart';
part 'contact_list_event.dart';
part 'contact_list_state.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  final ContactsRepository _contactsRepository;

  ContactListBloc({required ContactsRepository contactsRepository})
    : _contactsRepository = contactsRepository,
      super(ContactListState.initial()) {
    on<_ContactListEventFindAll>(_findAll);
    on<_ContactListEventDelete>(_deleteById);
    on<_ContactListEventRestore>(_restore);
  }

  FutureOr<void> _findAll(
    _ContactListEventFindAll event,
    Emitter<ContactListState> emit,
  ) async {
    try {
      emit(ContactListState.loading());
      final contacts = await _contactsRepository.findAll();
      await Future.delayed(const Duration(seconds: 1));
      //throw Exception();
      emit(ContactListState.data(contacts: contacts));
    } catch (e, s) {
      log('Erro ao buscar contato', error: e, stackTrace: s);
      emit(ContactListState.error(error: 'Erro ao buscar contatos'));
    }
  }

  FutureOr<void> _deleteById(
    _ContactListEventDelete event,
    Emitter<ContactListState> emit,
  ) async {
    try {
      //throw Exception('Erro de proposito');
      await _contactsRepository.deleteById(event.contact.id ?? '');

      // Buscar lista atualizada
      final updatedContacts = await _contactsRepository.findAll();

      // Emitir sucesso com contato deletado e lista atualizada
      emit(
        ContactListState.deleteSuccess(
          deletedContact: event.contact,
          contacts: updatedContacts,
        ),
      );
    } catch (e, s) {
      log('Erro ao excluir contato', error: e, stackTrace: s);
      emit(ContactListState.error(error: 'Erro ao excluir contato'));
    }
  }

  FutureOr<void> _restore(
    _ContactListEventRestore event,
    Emitter<ContactListState> emit,
  ) async {
    try {
      await _contactsRepository.restore(event.contact);

      add(ContactListEvent.findAll());
    } on DioError catch (e, s) {
      log('Dio: Erro ao restaurar contato', error: e.message, stackTrace: s);
      emit(
        ContactListState.error(error: 'Erro de conexão ao restaurar contato'),
      );
    } on Exception catch (e, s) {
      log('Erro ao restaurar contato', error: e.toString(), stackTrace: s);
      emit(
        ContactListState.error(error: 'Erro inesperado ao restaurar contato'),
      );
    }
  }
}
