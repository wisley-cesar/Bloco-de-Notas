import 'dart:ui';

import 'package:flutter/material.dart';

class ColorPalette {
  static const Color lightBackground = Color(0xFFECEFF7); // Fundo claro
  static const Color lightPrimary = Color(0xFF7C82A5); // Azul médio
  static const Color lightAccent = Color(0xFF666EAC); // Azul escuro
  static const Color lightText = Color(0xFF05050F); // Quase preto
  static const Color lightSubText = Color(0xFF9095B3); // Azul acinzentado
  static const Color lightDivider = Color(0xFFA9ADC6); // Azul claro
  static const Color lightCard = Color(0xFFFFFFFF); // Branco

  static const Color darkBackground = Color(0xFF05050F); // Quase preto
  static const Color darkPrimary = Color(0xFF474958); // Cinza escuro
  static const Color darkAccent = Color(0xFF7C82A5); // Azul médio
  static const Color darkText = Color(0xFFECEFF7); // Cinza claro
  static const Color darkSubText = Color(0xFF9095B3); // Azul acinzentado
  static const Color darkDivider = Color(0xFF666EAC); // Azul escuro
  static const Color darkCard = Color(0xFF1C1C28); // Quase preto
}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: ColorPalette.lightPrimary,
  scaffoldBackgroundColor: ColorPalette.lightBackground,
  appBarTheme: const AppBarTheme(
    color: ColorPalette.lightPrimary,
  ),
  colorScheme: ColorScheme.light(
    primary: ColorPalette.lightPrimary,
    secondary: ColorPalette.lightAccent,
    surface: ColorPalette.lightBackground,
    onSurface: ColorPalette.lightText,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(color: ColorPalette.lightText),
    displayMedium: TextStyle(color: ColorPalette.lightSubText),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ColorPalette.darkPrimary,
  scaffoldBackgroundColor: ColorPalette.darkBackground,
  appBarTheme: const AppBarTheme(
    color: ColorPalette.darkPrimary,
  ),
  colorScheme: ColorScheme.dark(
    primary: ColorPalette.darkPrimary,
    secondary: ColorPalette.darkAccent,
    surface: ColorPalette.darkBackground,
    onSurface: ColorPalette.darkText,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(color: ColorPalette.darkText),
    displayMedium: TextStyle(color: ColorPalette.darkSubText),
  ),
);
