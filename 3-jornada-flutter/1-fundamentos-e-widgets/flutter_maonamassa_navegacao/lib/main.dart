import 'package:flutter/material.dart';
import 'package:flutter_maonamassa_navegacao/core/navigator_observer_custom.dart';
import 'package:flutter_maonamassa_navegacao/pages/detail2_page.dart';
import 'package:flutter_maonamassa_navegacao/pages/detail_page.dart';
import 'package:flutter_maonamassa_navegacao/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorObservers: [
        NavigatorObserverCustom(),
      ],
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const HomePage(),
          );
        }
        if (settings.name == DetailPage.routeName) {
          String param =
              settings.arguments as String? ?? 'Nenhum parâmetro foi enviado.';
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => DetailPage(param: param),
          );
        }
        return null;
      },
      routes: {
        Detail2Page.routeName: (_) => const Detail2Page(),
      },
    );
  }
}
