import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/screen/authentication/login/component/login_component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      decoration: commonBoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            icLoginBg,
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: LoginComponent(
          size: size,
        ),
      ),
    );
  }
}
