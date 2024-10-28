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

class ForgotPasswordComponent extends StatelessWidget {
  const ForgotPasswordComponent({super.key, required this.size});

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
          _forgotView(size: size, context: context),
        ],
      ),
    );
  }

  _forgotView({required Size size, required BuildContext context}) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Form(
        key: provider.formForgotPasswordKey,
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
                  controller: provider.tetEmail,
                  validator: ValidationUtil.validateEmail,
                  top: size.height * zero05),
              commonInkWell(
                onTap: () => Navigator.pushNamed(context, RouteName.loginScreen),
                child: Align(
                    alignment: Alignment.center,
                    child: CommonTextWidget(
                      top: size.height * zero02,
                      style: GoogleFonts.outfit(
                          color: colorDarkBlue, fontWeight: FontWeight.w500),
                      text: backToLogin,
                    )),
              ),
              CommonButtonWidget(
                text: sendResetLink,
                top: size.height * zero02,
                onTap: () {
                  if (provider.formForgotPasswordKey.currentState!
                      .validate()) {}
                },
                width: size.width,
              )
            ],
          ),
        ),
      );
    });
  }
}
