import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_tabbar_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/profile_provider.dart';
import 'package:parsonskellogg/screen/profile/account_activity/account_activity_view.dart';
import 'package:parsonskellogg/screen/profile/my_account/my_account_view.dart';
import 'package:parsonskellogg/screen/profile/my_notification/my_notification_view.dart';
import 'package:parsonskellogg/screen/profile/system_log/system_log_view.dart';
import 'package:parsonskellogg/screen/profile/user_permission/user_permission_view.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, provider, child) {
      return Container(
        color: Colors.white,
        margin: const EdgeInsets.all(ten),
        padding: const EdgeInsets.only(
            top: twenty, left: ten, right: ten, bottom: twenty),
        child: CommonTabBarWidget(
          length: 5,
          tabs: [
            commonTab(text: myAccount, icon: icPerson),
            commonTab(text: myNotification, icon: icNotification),
            commonTab(
              text: systemLogTab,
              icon: icActivity,
            ),
            commonTab(text: userPermission, icon: icKey),
            commonTab(text: accountActivity, icon: icActivity),
          ],
          children: [
            MyAccountView(
              provider: provider,
            ),
            MyNotificationView(
              provider: provider,
            ),
            const SystemLogView(),
            const UserPermissionView(),
            const AccountActivityView()
          ],
        ),
      );
    });
  }
}
