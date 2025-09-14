import 'package:bloc_test/bloc_test.dart';
import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContactsRepository extends Mock implements ContactsRepository {}

void main() {
  late ContactsRepository repository;
  late List<ContactModel> contacts;

  setUpAll(() {
    // Registra fallback value para ContactModel no mocktail
    registerFallbackValue(
      ContactModel(name: 'fallback', email: 'fallback@test.com'),
    );
  });

  setUp(() {
    repository = MockContactsRepository();
    contacts = [
      ContactModel(name: 'Beatriz Dadalto', email: 'beatriz@email.com'),
      ContactModel(name: 'Bia Dadalto', email: 'bdadalto@email.com'),
    ];
  });

  group('ContactListCubit', () {
    blocTest<ContactListCubit, ContactListCubitState>(
      'Deve buscar contatos com sucesso',
      build: () {
        when(() => repository.findAll()).thenAnswer((_) async => contacts);
        return ContactListCubit(repository: repository);
      },
      act: (cubit) => cubit.findAll(),
      expect: () => [
        ContactListCubitState.loading(),
        ContactListCubitState.data(contacts: contacts),
      ],
    );

    blocTest<ContactListCubit, ContactListCubitState>(
      'Deve retornar erro quando repository falhar',
      build: () {
        when(
          () => repository.findAll(),
        ).thenThrow(Exception('Erro de conexão'));
        return ContactListCubit(repository: repository);
      },
      act: (cubit) => cubit.findAll(),
      expect: () => [
        ContactListCubitState.loading(),
        ContactListCubitState.error(error: 'Erro ao buscar contatos'),
      ],
    );

    blocTest<ContactListCubit, ContactListCubitState>(
      'Deve deletar contato e buscar lista atualizada',
      build: () {
        // Mock para delete e findAll subsequente
        when(() => repository.delete(any())).thenAnswer((_) async {});
        when(
          () => repository.findAll(),
        ).thenAnswer((_) async => [contacts.last]);
        return ContactListCubit(repository: repository);
      },
      act: (cubit) => cubit.deleteByModel(contacts.first),
      expect: () => [
        ContactListCubitState.loading(),
        ContactListCubitState.data(contacts: [contacts.last]),
      ],
    );

    blocTest<ContactListCubit, ContactListCubitState>(
      'Deve restaurar contato e buscar lista atualizada',
      build: () {
        // Mock para restore e findAll subsequente
        when(() => repository.restore(any())).thenAnswer((_) async {});
        when(() => repository.findAll()).thenAnswer((_) async => contacts);
        return ContactListCubit(repository: repository);
      },
      act: (cubit) => cubit.restore(contacts.first),
      expect: () => [
        ContactListCubitState.loading(),
        ContactListCubitState.data(contacts: contacts),
      ],
    );
  });
}
