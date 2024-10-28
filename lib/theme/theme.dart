import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData.from(
  useMaterial3: false,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromRGBO(241, 244, 248, 1),
    onPrimary: Colors.black,
    secondary: Colors.white70,
    onSecondary: Colors.black87,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black87,
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.outfit(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.2,
      color: Colors.black87,
    ),
    titleMedium: GoogleFonts.outfit(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.2,
      color: Colors.grey[600],
    ),
    titleSmall: GoogleFonts.outfit(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.2,
      color: Colors.grey.shade600,
    ),
    bodyMedium: GoogleFonts.outfit(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.2,
      color: Colors.grey.shade800,
    ),
  ),
).copyWith(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      elevation: 0,
      foregroundColor: Colors.white,
      textStyle: GoogleFonts.outfit(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
  ));

ThemeData darkTheme = ThemeData.from(
  useMaterial3: false,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.black54,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.black54,
    onSurface: Colors.white,
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.outfit(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.2,
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.outfit(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.2,
      color: Colors.white70,
    ),
    titleSmall: GoogleFonts.outfit(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.2,
      color: Colors.grey.shade600,
    ),
    bodyMedium: GoogleFonts.outfit(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.2,
      color: Colors.white,
    ),
  ),
).copyWith(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.black54,
      foregroundColor: Colors.white,
      textStyle: GoogleFonts.outfit(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),

)));