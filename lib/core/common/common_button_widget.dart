import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';

import 'common_text_widget.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({
    super.key,
    this.text,
    this.onTap,
    this.style,
    this.horizontal,
    this.vertical,
    this.top,
    this.bottom,
    this.left,
    this.icon,
    this.right,
    this.btnStyle,
    this.height,
    this.isShowIcon = false,
    this.width,
  });

  final String? text;

  final double? horizontal;
  final Widget? icon;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final double? vertical;
  final double? width;
  final double? height;
  final bool? isShowIcon;
  final TextStyle? style;
  final VoidCallback? onTap;
  final ButtonStyle? btnStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Set border color based on the theme mode
    final colorTextValue =
        theme.brightness == Brightness.dark ? Colors.white : Colors.white;
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(
          left: left ?? zero,
          right: right ?? zero,
          bottom: bottom ?? zero,
          top: top ?? zero),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: isShowIcon ?? true ? icon : null,
        style: btnStyle,
        label: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontal ?? twentyFour,
              vertical: vertical ?? twelve),
          child: CommonTextWidget(
            style: style ??
                GoogleFonts.outfit(
                    color: colorTextValue, fontWeight: FontWeight.w500),
            text: text,
          ),
        ),
      ),
    );
  }
}
