import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).redirectToLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: colorWhite,
      body: PopScope(
        canPop: true,
        onPopInvokedWithResult: (data, dynamic) {
          SystemNavigator.pop();
        },
        child: Center(
          child: loadAssetImage(path: icLogo, width: size.width * zero7),
        ),
      ),
    );
  }
}
