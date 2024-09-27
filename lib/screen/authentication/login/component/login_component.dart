import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/common/common_button_widget.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/core/router/route_name.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/core/validation/validation_util.dart';
import 'package:parsonskellogg/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginComponent extends StatelessWidget {
  const LoginComponent({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      alignment: Alignment.center,
      height: size.height,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          _loginView(size: size, context: context),
        ],
      ),
    );
  }

  _loginView({required Size size, required BuildContext context}) {

    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Form(
        key: provider.formLoginKey,
        child: Container(
          margin: const EdgeInsets.all(fifteen),
          decoration: commonBoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(ten)),
          padding: const EdgeInsets.all(twenty),
          child: Column(
            children: [
              loadAssetImage(path: icLoginLogo, width: size.width * zero5),
              commonTextFieldWithTextView(
                  onChanged: (value) {
                    provider.setEmail = value;
                  },
                  validator: ValidationUtil.validateEmail,
                  controller: provider.tetEmail,
                  top: size.height * zero05),
              commonTextFieldWithTextView(
                  top: fifteen,
                  title: password,

                  onChanged: (value) {
                    provider.setPassword = value;
                  },
                  validator: ValidationUtil.validatePassword,
                  controller: provider.tetPassword,
                  obscureText: provider.obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      size: twenty,
                      color: Colors.grey,
                      provider.obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () => provider.togglePasswordVisibility(),
                  )),
              commonInkWell(
                onTap: () => Navigator.pushNamed(context, forgotPasswordScreen),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: CommonTextWidget(
                      top: ten,
                      style: GoogleFonts.outfit(
                          color: colorDarkBlue, fontWeight: FontWeight.w500),
                      text: forgotPassword,
                    )),
              ),
              CommonButtonWidget(
                text: login,
                onTap: () {
                  if(provider.formLoginKey.currentState!.validate()){

                  }

                },
                top: size.height * zero03,
                width: size.width,
              )
            ],
          ),
        ),
      );
    });
  }
}
