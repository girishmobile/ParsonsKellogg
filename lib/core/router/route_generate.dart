
import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/router/route_name.dart';
import 'package:parsonskellogg/screen/authentication/forgot_password/forgot_password_screen.dart';
import 'package:parsonskellogg/screen/authentication/login/login_screen.dart';
import 'package:parsonskellogg/screen/dashboard/dashboard_screen.dart';
import 'package:parsonskellogg/screen/splash/splash_screen.dart';

class RouterGenerated {
   static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
