import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact List')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/contacts/register');
          if (context.mounted) {
            context.read<ContactListBloc>().add(
              const ContactListEvent.findAll(),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
      body: BlocListener<ContactListBloc, ContactListState>(
        listenWhen: (previous, current) {
          return current.maybeWhen(
            error: (error) => true,
            deleteSuccess: (deletedContact, contacts) =>
                true, // ✅ Escutar sucesso
            orElse: () => false,
          );
        },
        listener: (context, state) {
          state.whenOrNull(
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error, style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.red,
                ),
              );
              context.read<ContactListBloc>().add(ContactListEvent.findAll());
            },
            deleteSuccess: (deletedContact, contacts) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Contato ${deletedContact.name} foi excluído',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 4),
                  action: SnackBarAction(
                    label: 'Desfazer',
                    onPressed: () async {
                      context.read<ContactListBloc>().add(
                        ContactListEvent.restore(contact: deletedContact),
                      );
                    },
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                  ),
                ),
              );
            },
          );
        },
        child: RefreshIndicator(
          onRefresh: () async =>
              context.read<ContactListBloc>()
                ..add(const ContactListEvent.findAll()),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
                    Loader<ContactListBloc, ContactListState>(
                      selector: (state) {
                        return state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                      },
                    ),
                    BlocSelector<
                      ContactListBloc,
                      ContactListState,
                      List<ContactModel>
                    >(
                      selector: (state) {
                        return state.maybeWhen(
                          data: (contacts) => contacts,
                          deleteSuccess: (deletedContact, contacts) =>
                              contacts, // ✅ Usar contacts do deleteSuccess
                          orElse: () => [],
                        );
                      },
                      builder: (_, contacts) {
                        return RefreshIndicator(
                          onRefresh: () async =>
                              context.read<ContactListBloc>()
                                ..add(const ContactListEvent.findAll()),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: contacts.length,
                            itemBuilder: (context, index) {
                              final contact = contacts[index];
                              return Dismissible(
                                key: Key(contact.id ?? ''),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20.0),
                                  color: Colors.red,
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                                confirmDismiss: (direction) async {
                                  return await showDialog<bool>(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text(
                                            'Deseja excluir ${contact.name}?',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.of(
                                                context,
                                              ).pop(false),
                                              child: Text('Cancelar'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.of(
                                                context,
                                              ).pop(true),
                                              style: TextButton.styleFrom(
                                                foregroundColor: Colors.red,
                                              ),
                                              child: Text('Excluir'),
                                            ),
                                          ],
                                        ),
                                      ) ??
                                      false;
                                },
                                onDismissed: (direction) {
                                  // ✅ Apenas dispara o evento - BlocListener cuida do resto
                                  context.read<ContactListBloc>().add(
                                    ContactListEvent.delete(
                                      contact: contact,
                                    ),
                                  );
                                },
                                child: ListTile(
                                  onTap: () async {
                                    await _navigateToUpdate(context, contact);
                                  },
                                  title: Text(contact.name),
                                  subtitle: Text(contact.email),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _navigateToUpdate(
    BuildContext context,
    ContactModel contact,
  ) async {
    final bloc = context.read<ContactListBloc>();

    await Navigator.pushNamed(
      context,
      '/contacts/update',
      arguments: contact,
    );

    if (context.mounted) {
      bloc.add(
        ContactListEvent.findAll(),
      );
    }
  }
}
