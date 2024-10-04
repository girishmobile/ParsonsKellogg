import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/common/common_button_widget.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: commonBoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: one)),
        child: ClipOval(
          child: loadAssetImage(path: icDummyUser),
        ),
      ),
      subtitle: CommonTextWidget(
        top: five,
        text: photoDesc,
        style: commonTextStyle(fontSize: ten),
      ),
      title: CommonButtonWidget(
        btnStyle: commonButtonStyle(color: colorBtnChange),
        text: change,
        horizontal: zero,
        vertical: zero,
        left: zero,
        style: commonTextStyle(
            fontSize: eleven, color: Colors.white, fontWeight: FontWeight.w500),
        right: size.width * zero42,
        height: thirty,
      ),
    );
  }
}
