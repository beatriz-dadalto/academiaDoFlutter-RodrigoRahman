import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/app_widget.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart'
    as app_auth;
import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';
import 'package:todo_list_provider/app/repositories/tasks/task_repository.dart';
import 'package:todo_list_provider/app/repositories/tasks/task_repository_impl.dart';
import 'package:todo_list_provider/app/repositories/user/user_repository.dart';
import 'package:todo_list_provider/app/repositories/user/user_repository_impl.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';
import 'package:todo_list_provider/app/services/user/user_service_impl.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FirebaseAuth.instance),
        Provider(create: (_) => SqliteConnectionFactory(), lazy: true),
        Provider<UserRepository>(
          create: (context) =>
              UserRepositoryImpl(firebaseAuth: context.read<FirebaseAuth>()),
        ),
        Provider<TaskRepository>(
          create: (context) => TaskRepositoryImpl(
            sqliteConnectionFactory: context.read<SqliteConnectionFactory>(),
          ),
        ),
        Provider<UserService>(
          create: (context) => UserServiceImpl(
            userRepository: context.read<UserRepository>(),
            taskRepository: context.read<TaskRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => app_auth.AuthProvider(
            firebaseAuth: context.read<FirebaseAuth>(),
            userService: context.read<UserService>(),
          )..loadListener(),
          lazy: false,
        ),
      ],
      child: AppWidget(),
    );
  }
}
