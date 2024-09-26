import 'package:flutter/material.dart';
import 'package:parsonskellogg/provider/theme_notifier.dart';
import 'package:parsonskellogg/screens/home_page.dart';
import 'package:parsonskellogg/theme/custom_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}
