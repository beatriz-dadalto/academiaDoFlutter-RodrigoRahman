import 'package:flutter/material.dart';
import 'package:flutter_maonamassa/navegacao/home_page.dart' as navegacao;
import 'package:flutter_maonamassa/navegacao/page_four.dart';
import 'package:flutter_maonamassa/navegacao/page_one.dart';
import 'package:flutter_maonamassa/navegacao/page_three.dart';
import 'package:flutter_maonamassa/navegacao/page_two.dart';
import 'package:flutter_maonamassa/navegacao_params/details.dart';
import 'package:flutter_maonamassa/navegacao_params/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // home: navegacao.HomePage(),
      initialRoute: '/navegacao_param',
      routes: {
        '/': (_) => const navegacao.HomePage(),
        '/page1': (_) => const PageOne(),
        PageTwo.routeName: (_) => const PageTwo(),
        '/page3': (_) => const PageThree(),
        '/page4': (_) => const PageFour(),
        '/navegacao_param': (_) => const Listy(),
        '/details': (_) => const Details(),
      },
    );
  }
}
