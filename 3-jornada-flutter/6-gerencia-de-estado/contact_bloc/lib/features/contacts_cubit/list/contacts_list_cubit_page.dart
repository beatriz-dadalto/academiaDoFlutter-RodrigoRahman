import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsListCubitPage extends StatelessWidget {
  const ContactsListCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Cubit'),
      ),
      body: RefreshIndicator(
        onRefresh: () => context.read<ContactListCubit>().findAll(),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  Loader<ContactListCubit, ContactListCubitState>(
                    selector: (state) {
                      return state.maybeWhen(
                        orElse: () => false,
                        loading: () => true,
                      );
                    },
                  ),
                  BlocSelector<
                    ContactListCubit,
                    ContactListCubitState,
                    List<ContactModel>
                  >(
                    selector: (state) {
                      return state.maybeWhen(
                        data: (contacts) => contacts,
                        orElse: () => <ContactModel>[],
                      );
                    },
                    builder: (_, contacts) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: contacts.length,
                        itemBuilder: (_, index) {
                          final contact = contacts[index];

                          return Dismissible(
                            key: Key(contact.id ?? '$index'),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 202.0),
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
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.red,
                                          ),
                                          child: const Text('Excluir'),
                                        ),
                                      ],
                                    ),
                                  ) ??
                                  false; // false se cancelar
                            },
                            onDismissed: (direction) {
                              final contactToDelete = contact;

                              context.read<ContactListCubit>().deleteByModel(
                                contact,
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${contact.name} foi excluído'),
                                  duration: Duration(seconds: 4),
                                  action: SnackBarAction(
                                    label: 'Desfazer',
                                    onPressed: () {
                                      context.read<ContactListCubit>().restore(
                                        contactToDelete,
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              onLongPress: () => context
                                  .read<ContactListCubit>()
                                  .deleteByModel(contact),
                              title: Text(contact.name),
                              subtitle: Text(contact.email),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
