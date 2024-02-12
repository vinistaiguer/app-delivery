import 'package:app_chat/core/palette.dart';
import 'package:flutter/material.dart';

class TaguaTheme {
  static ThemeData getTheme() => ThemeData(
      textTheme: textTheme(), elevatedButtonTheme: elevatedButtonThemeData());

  static TextTheme textTheme() => const TextTheme(
        titleLarge: TextStyle(
          color: Palette.secondary,
          fontSize: 25,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            letterSpacing: 0),
      );

  static ElevatedButtonThemeData elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.primary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
