import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade400);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  textTheme:commonTextThemes(color: colorText),
  elevatedButtonTheme:commonButtonThemes() ,
  appBarTheme: commonAppBarTheme(backgroundColor: Colors.white,colorText: Colors.black),

  colorScheme: const ColorScheme.light().copyWith(
    onPrimary: Colors.red,
    surface: kColorScheme.surface,
    primary: kColorScheme.primary,
    secondary: kColorScheme.secondary,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor:colorBackgroundDark,
  scaffoldBackgroundColor: colorBackgroundDark,
  textTheme:commonTextThemes(color: Colors.white),
  elevatedButtonTheme:commonButtonThemes(color: colorButton),
  /*appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  )*/

  appBarTheme: commonAppBarTheme(backgroundColor: colorBackgroundDark,colorText: Colors.white),
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
);


commonTextThemes({Color? color}){
  return TextTheme(

    bodyMedium: GoogleFonts.outfit(fontSize: fourteen, fontWeight: FontWeight.w400, color: color??Colors.black),
    bodyLarge: GoogleFonts.outfit(fontSize: sixteen ,color: color??Colors.black87,fontWeight: FontWeight.w600),
    bodySmall: GoogleFonts.outfit(fontSize: twelve, fontWeight: FontWeight.w400, color: color??Colors.black),
    // Add more text styles as needed
  );

}
commonButtonThemes({Color? color}){
  return ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(

        backgroundColor: color??colorButton,
        foregroundColor: color??colorButton,
        disabledBackgroundColor:color?? colorButton,

        disabledForegroundColor: color??colorButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(five), // <-- Radius
        ),
        elevation: zero,
      )
  );

}

commonAppBarTheme({Color? backgroundColor,Color? colorText}){
  return AppBarTheme(
    backgroundColor: backgroundColor??Colors.white,
    titleTextStyle: GoogleFonts.outfit(color:colorText?? Colors.black, fontSize: sixteen),
  );
}