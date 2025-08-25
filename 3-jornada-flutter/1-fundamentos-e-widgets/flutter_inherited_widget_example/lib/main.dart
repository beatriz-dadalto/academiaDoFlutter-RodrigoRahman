import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget_example/home/home_page.dart';
import 'package:flutter_inherited_widget_example/model/user_model.dart';
import 'package:flutter_inherited_widget_example/splash/splash_page.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return UserModel(
      name: 'Marilyn Manson',
      imgAvatar: 'https://rollingstone.com.br/media/_versions/marilyn-manson-2003-foto-jon_kopaloff-getty_images_widelg.jpg',
      birthDate: ' (05/01/1969)',
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: {
          '/': (_) => SplashPage(),
          '/home': (_) => HomePage(),
        },
      ),
    );
  }
}
