import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListUiConfig {
  TodoListUiConfig._();

  static ThemeData get theme => ThemeData(
    textTheme: GoogleFonts.mandaliTextTheme(),
    primaryColor: Color(0XFF5C77CE),
    primaryColorLight: Color(0XFFABC8F7),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue,
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0XFF5C77CE),
        foregroundColor: Colors.white
      )
    )
  );
}
