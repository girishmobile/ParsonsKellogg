import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/router/route_generate.dart';
import 'package:parsonskellogg/core/router/route_name.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/auth_provider.dart';
import 'package:parsonskellogg/provider/common_provider.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';
import 'package:parsonskellogg/provider/menu_provider.dart';
import 'package:parsonskellogg/provider/profile_provider.dart';
import 'package:parsonskellogg/provider/theme_provider.dart';
import 'package:parsonskellogg/theme/theme.dart';
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
        ChangeNotifierProvider<DashboardProvider>(
            create: (_) => DashboardProvider()),
        ChangeNotifierProvider<CommonProvider>(create: (_) => CommonProvider()),
        ChangeNotifierProvider<ProfileProvider>(
            create: (_) => ProfileProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          title: appName,
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouterGenerated.generateRoute,
          initialRoute: RouteName.splashScreen,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
        );
      }),
    );
  }
}
