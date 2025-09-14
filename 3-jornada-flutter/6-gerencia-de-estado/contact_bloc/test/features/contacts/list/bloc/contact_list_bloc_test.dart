import 'package:bloc_test/bloc_test.dart';
import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContactsRepository extends Mock implements ContactsRepository {}

void main() {
  // declaração
  late ContactsRepository repository;
  late ContactListBloc bloc;
  late List<ContactModel> contacts;

  // preparação
  setUp(
    () {
      repository = MockContactsRepository();
      bloc = ContactListBloc(contactsRepository: repository);
      contacts = [
        ContactModel(name: 'Beatriz Dadalto', email: 'beatriz@email.com'),
        ContactModel(name: 'Bia Dadalto', email: 'bdadalto@email.com'),
      ];
    },
  );

  // execução
  group('ContactListBloc', () {
    blocTest<ContactListBloc, ContactListState>(
      'Deve buscar os contatos com sucesso',
      build: () {
        // ✅ Configurar mock ANTES de criar o bloc
        when(() => repository.findAll()).thenAnswer((_) async => contacts);
        return ContactListBloc(contactsRepository: repository);
      },
      act: (bloc) => bloc.add(const ContactListEvent.findAll()),
      wait: const Duration(seconds: 2), // Aguarda o Future.delayed do BLoC
      expect: () => [
        ContactListState.loading(),
        ContactListState.data(contacts: contacts),
      ],
    );

    blocTest<ContactListBloc, ContactListState>(
      'Deve retornar erro quando repository falhar',
      build: () {
        // ✅ Configurar mock para lançar exceção
        when(
          () => repository.findAll(),
        ).thenThrow(Exception('Erro de conexão'));
        return ContactListBloc(contactsRepository: repository);
      },
      act: (bloc) => bloc.add(const ContactListEvent.findAll()),
      expect: () => [
        ContactListState.loading(),
        ContactListState.error(error: 'Erro ao buscar contatos'),
      ],
    );
    blocTest<ContactListBloc, ContactListState>(
      'Deve deletar contato com sucesso',
      build: () {
        // ✅ Mock para delete
        when(() => repository.deleteById(any())).thenAnswer((_) async {});
        when(
          () => repository.findAll(),
        ).thenAnswer((_) async => [contacts.last]); // Lista sem o primeiro
        return ContactListBloc(contactsRepository: repository);
      },
      act: (bloc) => bloc.add(ContactListEvent.delete(contact: contacts.first)),
      expect: () => [
        ContactListState.deleteSuccess(
          deletedContact: contacts.first,
          contacts: [contacts.last],
        ),
      ],
    );

    blocTest<ContactListBloc, ContactListState>(
      'Deve retornar erro ao falhar delete',
      build: () {
        // ✅ Mock para delete falhar
        when(
          () => repository.deleteById(any()),
        ).thenThrow(Exception('Erro ao deletar'));
        return ContactListBloc(contactsRepository: repository);
      },
      act: (bloc) => bloc.add(ContactListEvent.delete(contact: contacts.first)),
      expect: () => [
        ContactListState.error(error: 'Erro ao excluir contato'),
      ],
    );
  });
}
