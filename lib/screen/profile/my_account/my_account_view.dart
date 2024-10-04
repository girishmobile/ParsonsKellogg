import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/provider/profile_provider.dart';
import 'package:parsonskellogg/screen/profile/my_account/widget/photo_widget.dart';
import 'package:parsonskellogg/screen/profile/my_account/widget/user_password_widget.dart';
import 'package:parsonskellogg/screen/profile/my_account/widget/user_profile_widget.dart';

class MyAccountView extends StatelessWidget {
  MyAccountView({super.key, required this.provider});

  final ProfileProvider provider;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(ten),
      child: ListView(
        controller: _scrollController,
        children: [
          SizedBox(
            height: size.height * zero02,
          ),
          const Divider(
            thickness: zero3,
            color: Colors.grey,
          ),
          CommonTextWidget(
            text: "My Account (Sameer Khan)",
            style: commonTextStyle(
                fontSize: fourteen, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: size.height * zero02,
          ),
          PhotoWidget(size: size),
          UserProfileWidget(size: size, provider: provider),
          UserPasswordWidget(
              size: size,
              provider: provider,
              scrollController: _scrollController)
        ],
      ),
    );
  }
}
