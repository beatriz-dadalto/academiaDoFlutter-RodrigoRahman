import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/app_module.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    if (e.toString().contains(
      'A Firebase App named "[DEFAULT]" already exists',
    )) {
      // já inicializado, pode ignorar
    } else {
      rethrow;
    }
  }
  runApp(AppModule());
}
