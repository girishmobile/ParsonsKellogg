import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/router/route_generate.dart';
import 'package:parsonskellogg/core/router/route_name.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/core/theme/theme.dart';
import 'package:parsonskellogg/provider/auth_provider.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';
import 'package:parsonskellogg/provider/menu_provider.dart';
import 'package:parsonskellogg/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<MenuProvider>(create: (_) => MenuProvider()),
        ChangeNotifierProvider<DashboardProvider>(create: (_) => DashboardProvider()),

      ],
      child: Consumer<ThemeProvider>(
        builder: (context,themeProvider,child) {
          return MaterialApp(
            title: appName,
            theme: lightMode,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouterGenerated.generateRoute,
            initialRoute: splashScreen,
            darkTheme: darkMode,
            themeMode: themeProvider.themeMode,
            //theme: ThemeData.light(),
          );
        }
      ),
    );
  }
}

