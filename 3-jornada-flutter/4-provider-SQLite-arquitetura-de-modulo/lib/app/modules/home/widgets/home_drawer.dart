import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart';
import 'package:todo_list_provider/app/core/ui/messages.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key});

  final nameNotifier = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.primaryColor.withAlpha(70),
            ),
            child: Row(
              children: [
                Selector<AuthProvider, String>(
                  builder: (context, value, child) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(value),
                      radius: 30.0,
                    );
                  },
                  selector: (context, authProvider) {
                    return authProvider.user?.photoURL ??
                        'https://cdn.areademembros.com/image?p=instancia_1345%2Fimage%2FqO3OCZS8hukkR2VwxbOlpMc1d79PWN5MhLnU7ems.png&w=40&h=40&t=crop&d=default.png&i=1345&uptkn=ecc239e84bdd14272cf8a04b3601e17c';
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Selector<AuthProvider, String>(
                      builder: (context, value, child) {
                        return Text(
                          value,
                          style: context.textTheme.titleMedium,
                        );
                      },
                      selector: (context, authProvider) {
                        return authProvider.user?.displayName ??
                            'Nome não informado!';
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Alterar nome'),
                    content: TextField(
                      onChanged: (value) => nameNotifier.value = value,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        child: Text('Alterar'),
                        onPressed: () async {
                          final nameValue = nameNotifier.value;
                          if (nameValue.isEmpty) {
                            Messages.of(context).showError('Nome obrigatório');
                          } else {
                            Loader.show(context);
                            await context.read<UserService>().updateDisplayName(
                              nameValue,
                            );
                            Loader.hide();
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
            title: Text('Alterar nome'),
          ),
          ListTile(
            onTap: () {
              context.read<AuthProvider>().logout();
            },
            title: Text('Sair'),
          ),
        ],
      ),
    );
  }
}
