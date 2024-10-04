import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/profile_provider.dart';

class MyNotificationView extends StatelessWidget {
  const MyNotificationView({super.key, required this.provider});

  final ProfileProvider provider;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
          top: twenty, left: ten, right: ten, bottom: twenty),
      width: size.width,
      height: size.height,
      child: ListView(
        children: [
          CommonTextWidget(
            text: general,
            style:
                commonTextStyle(fontWeight: FontWeight.w600, fontSize: sixteen),
          ),
          SizedBox(
            height: size.height * zero02,
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: provider.notification.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                SwitchItem switchItem = provider.notification[index];

                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: CommonTextWidget(
                    text: switchItem.name,
                    style: commonTextStyle(
                        fontWeight: FontWeight.w600, fontSize: thirteen),
                  ),
                  subtitle: CommonTextWidget(
                    text: switchItem.desc,
                    style: commonTextStyle(fontSize: ten),
                  ),
                  trailing: Transform.scale(
                    scale: zero7,
                    child: CupertinoSwitch(
                      value: switchItem.isSwitched,
                      onChanged: (value) {
                        provider.toggleSwitch(index);
                      },
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
