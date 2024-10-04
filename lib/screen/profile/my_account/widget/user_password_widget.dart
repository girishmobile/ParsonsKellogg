import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_button_widget.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/profile_provider.dart';

class UserPasswordWidget extends StatelessWidget {
  const UserPasswordWidget(
      {super.key,
      required this.size,
      required this.provider,
      required this.scrollController});

  final Size size;
  final ProfileProvider provider;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (provider.isVisiblePassword) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent, // Scroll to the end
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          top: size.height * zero02,
          text: password,
          style:
              commonTextStyle(fontSize: fourteen, fontWeight: FontWeight.w600),
        ),
        CommonTextWidget(
          top: ten,
          text: passwordDesc,
          style: commonTextStyle(fontSize: twelve),
        ),
        CommonButtonWidget(
          top: fifteen,
          onTap: () {
            provider.toggleVisibility();
          },
          style: commonTextStyle(color: Colors.black, fontSize: twelve),
          text: setNewPassword,
          btnStyle: commonButtonStyle(
              borderColor: Colors.grey,
              width: one,
              borderRadius: eight,
              color: Colors.white),
        ),
        const SizedBox(
          height: fifteen,
        ),
        Visibility(
            visible: provider.isVisiblePassword,
            child: Column(
              children: [
                commonTextFieldWithTextView(
                    fontSize: thirteen,
                    controller: provider.tetCurrentPassword,
                    onChanged: (value) {
                      provider.setCurrentPassword = value;
                    },
                    title: currentPassword,
                    hint: currentPassword),
                commonTextFieldWithTextView(
                    fontSize: thirteen,
                    controller: provider.tetNewPassword,
                    onChanged: (value) {
                      provider.setNewPassword = value;
                    },
                    top: size.height * zero02,
                    title: newPassword,
                    hint: newPassword),
                commonTextFieldWithTextView(
                    fontSize: thirteen,
                    controller: provider.tetReEnterPassword,
                    onChanged: (value) {
                      provider.setReEnterPassword = value;
                    },
                    top: size.height * zero02,
                    title: reEnterPassword,
                    hint: reEnterPassword),
                const SizedBox(
                  height: fifteen,
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: CommonButtonWidget(
                    text: changePassword,
                  ),
                )
              ],
            ))
      ],
    );
  }
}
