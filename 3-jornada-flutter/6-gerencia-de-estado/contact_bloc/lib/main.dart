import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_example.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed/example_freezed_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed_example.dart';
import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/features/contacts/list/contacts_list_page.dart';
import 'package:contact_bloc/features/contacts/register/bloc/contact_register_bloc.dart';
import 'package:contact_bloc/features/contacts/register/contact_register_page.dart';
import 'package:contact_bloc/features/contacts/update/bloc/contact_update_bloc.dart';
import 'package:contact_bloc/features/contacts/update/contact_update_page.dart';
import 'package:contact_bloc/features/contacts_cubit/list/contacts_list_cubit_page.dart';
import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/home/home_page.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ContactsRepository(),
      child: MaterialApp(
        initialRoute: '/home',
        debugShowCheckedModeBanner: false,
        title: 'Contact Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomePage(),
        routes: {
          '/home': (_) => HomePage(),
          '/bloc/example/': (_) => BlocProvider(
            create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
            child: const BlocExample(),
          ),
          '/bloc/example/freezed': (_) => BlocProvider(
            create: (context) =>
                ExampleFreezedBloc()
                  ..add(const ExampleFreezedEvent.findNames()),
            child: const BlocFreezedExample(),
          ),
          '/contacts/list': (context) => BlocProvider(
            create: (_) => ContactListBloc(
              contactsRepository: context.read<ContactsRepository>(),
            )..add(ContactListEvent.findAll()),
            child: const ContactsListPage(),
          ),
          '/contacts/register': (context) => BlocProvider(
            create: (context) =>
                ContactRegisterBloc(repository: context.read()),
            child: const ContactRegisterPage(),
          ),
          '/contacts/update': (context) {
            final arguments = ModalRoute.of(context)?.settings.arguments;
            if (arguments is! ContactModel) {
              throw ArgumentError(
                'Expected ContactModel, got ${arguments.runtimeType}',
              );
            }
            final contact = arguments; // Type Promotion sem cast explícito
            return BlocProvider(
              create: (context) =>
                  ContactUpdateBloc(repository: context.read()),
              child: ContactUpdatePage(
                contact: contact,
              ),
            );
          },
          '/contacts/cubit/list': (context) {
            return BlocProvider(
              create: (context) => ContactListCubit(repository: context.read())..findAll(),
              child: ContactsListCubitPage(),
            );
          },
        },
      ),
    );
  }
}
