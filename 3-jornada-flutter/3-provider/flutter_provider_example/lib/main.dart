import 'package:flutter/material.dart';
import 'package:flutter_provider_example/provider/provider_page.dart';
import 'package:flutter_provider_example/provider/user_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return UserModel(
          name: 'Sabrina Carpenter',
          imgAvatar:
              'https://tmjbrazil.com.br/wp-content/uploads/2025/02/Sabrina-Carpenter-conta-como-comecou-a-carreira-de-cantora.png',
          birthDate: '11/05/1999',
        );
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: {
          '/provider': (_) => ProviderPage(),
        },
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/provider');
                      },
                      child: Text('Provider'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Change Notifier '),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
