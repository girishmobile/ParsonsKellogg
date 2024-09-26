import 'package:flutter/material.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(96, 209, 56, 1),
  brightness: Brightness.light,
);
final kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(9, 10, 9, 1),
  brightness: Brightness.dark,
);

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light().copyWith(
    surface: kColorScheme.surface,
    primary: kColorScheme.primary,
    secondary: kColorScheme.secondary,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kColorScheme.secondaryContainer,
    margin: const EdgeInsets.all(16),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primary,
      foregroundColor: kColorScheme.onPrimary,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.normal,
          color: kColorScheme.onSecondaryContainer,
          fontSize: 16,
        ),
      ),
);

ThemeData darkTheme = ThemeData().copyWith(
  colorScheme: const ColorScheme.dark().copyWith(
    surface: kDarkColorScheme.surface,
    primary: kDarkColorScheme.primary,
    secondary: kDarkColorScheme.secondary,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kDarkColorScheme.secondaryContainer,
    margin: const EdgeInsets.all(16),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kDarkColorScheme.primary,
      foregroundColor: kDarkColorScheme.onPrimary,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: kDarkColorScheme.onSecondaryContainer,
          fontSize: 16,
        ),
      ),
);
