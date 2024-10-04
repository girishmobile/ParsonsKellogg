import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade400);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  textTheme: commonTextThemes(color: colorText),
  elevatedButtonTheme: commonButtonThemes(),
  checkboxTheme:
      commonCheckBoxTheme(checkColor: Colors.white, fillColor: colorBtnChange),
  appBarTheme:
      commonAppBarTheme(backgroundColor: Colors.white, colorText: Colors.black),
  colorScheme: const ColorScheme.light().copyWith(
    onPrimary: Colors.red,
    surface: kColorScheme.surface,
    primary: kColorScheme.primary,
    secondary: kColorScheme.secondary,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  checkboxTheme:
      commonCheckBoxTheme(checkColor: Colors.white, fillColor: colorBtnChange),
  primaryColor: colorBackgroundDark,
  scaffoldBackgroundColor: colorBackgroundDark,
  textTheme: commonTextThemes(color: Colors.white),
  elevatedButtonTheme: commonButtonThemes(color: colorButton),
  /*appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  )*/

  appBarTheme: commonAppBarTheme(
      backgroundColor: colorBackgroundDark, colorText: Colors.white),
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
);

commonTextThemes({Color? color}) {
  return TextTheme(
    bodyMedium: GoogleFonts.outfit(
        fontSize: fourteen,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black),
    bodyLarge: GoogleFonts.outfit(
        fontSize: sixteen,
        color: color ?? Colors.black87,
        fontWeight: FontWeight.w600),
    bodySmall: GoogleFonts.outfit(
        fontSize: twelve,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black),
    // Add more text styles as needed
  );
}

commonButtonThemes({Color? color}) {
  return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: color ?? colorButton,
    foregroundColor: color ?? colorButton,
    disabledBackgroundColor: color ?? colorButton,
    disabledForegroundColor: color ?? colorButton,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(five), // <-- Radius
    ),
    elevation: zero,
  ));
}

commonAppBarTheme({Color? backgroundColor, Color? colorText}) {
  return AppBarTheme(
    backgroundColor: backgroundColor ?? Colors.white,
    titleTextStyle:
        GoogleFonts.outfit(color: colorText ?? Colors.black, fontSize: sixteen),
  );
}

commonCheckBoxTheme({Color? checkColor, Color? fillColor}) {
  return CheckboxThemeData(
    shape: RoundedRectangleBorder(
      // Custom shape
      borderRadius: BorderRadius.circular(5.0),
      side: const BorderSide(color: Colors.blue, width: 2.0),
    ),
    checkColor: WidgetStateProperty.all(checkColor ?? Colors.white),
    overlayColor: WidgetStateProperty.all(checkColor ?? Colors.red),
    side: const BorderSide(width: 2, color: colorBtnChange),
    //fillColor: WidgetStateProperty.all(fillColor??Colors.orange),
  );
}
