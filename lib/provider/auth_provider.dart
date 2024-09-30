import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/router/route_name.dart';

class AuthProvider extends ChangeNotifier {
  /*--------------------------------Redirect to login ----------------------------------------*/
  void redirectToLogin(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, loginScreen, (Route<dynamic> route) => false);
    });
  }

  /*--------------------------------Password ----------------------------------------*/
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  /*--------------------------------------------------------------------------*/
  //Login form Validation
  final tetPassword = TextEditingController();
  final tetEmail = TextEditingController();
  final formLoginKey = GlobalKey<FormState>();
  final formForgotPasswordKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  String get email => _email;

  String get password => _password;

  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  set setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  /*-------------------------------------------------------------------------- */

  void redirectToDashboard(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, dashboardScreen, (Route<dynamic> route) => false);
  }
}
