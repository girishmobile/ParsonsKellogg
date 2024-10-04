import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_button_widget.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/profile_provider.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget(
      {super.key, required this.size, required this.provider});

  final Size size;
  final ProfileProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          top: size.height * zero02,
          text: userProfile,
          style:
              commonTextStyle(fontSize: fourteen, fontWeight: FontWeight.w600),
        ),
        CommonTextWidget(
          text: userProfileDesc,
          style: commonTextStyle(fontSize: twelve),
        ),
        commonTextFieldWithTextView(
            hint: "Sameer",
            controller: provider.tetFName,
            onChanged: (value) {
              provider.setFName = value;
            },
            fontSize: thirteen,
            title: "$firstName*",

            top: size.height * zero02),
        commonTextFieldWithTextView(
            hint: "Sameer",
            fontSize: thirteen,
            title: "$lastName*",
            controller: provider.tetLName,
            onChanged: (value) {
              provider.setLName = value;
            },
            top: size.height * zero02),
        commonTextFieldWithTextView(
            hint: "Sameer",
            fontSize: thirteen,

            title: "$phoneNo*",
            controller: provider.tetPhone,
            onChanged: (value) {
              provider.setPhone = value;
            },
            top: size.height * zero02),
        commonTextFieldWithTextView(
            hint: "",
            readOnly: true,
            title: reportTo,
            fontSize: thirteen,
            colorFill: Colors.grey.withOpacity(zero15),
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
            onChanged: (value) {
            },
            top: size.height * zero02),
        SizedBox(
          height: size.height * zero01,
        ),

        const Align(
            alignment: Alignment.topRight,
            child: CommonButtonWidget(text: update,)),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              visualDensity: const VisualDensity(vertical: -4),
              value: provider.isChecked,
              onChanged: provider.toggleCheckbox,
            ),
            const CommonTextWidget(
              text: superUsers,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              visualDensity: const VisualDensity(vertical: -4),
              value: provider.isCheckedReceive,
              onChanged: provider.toggleCheckReview,
            ),
            const CommonTextWidget(
              text: acceptReceive,
            ),
          ],
        ),
        CommonTextWidget(
          top: size.height * zero02,
          text: email,
          style:
              commonTextStyle(fontSize: fourteen, fontWeight: FontWeight.w600),
        ),
        CommonTextWidget(
          top: ten,
          text: "sameer@redefinesolutions.com",
          style: commonTextStyle(fontSize: twelve),
        ),
      ],
    );
  }
}
