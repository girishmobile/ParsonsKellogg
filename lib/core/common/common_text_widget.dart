import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';

class CommonTextWidget extends StatelessWidget {
  const CommonTextWidget(
      {this.top,
      this.left,
      this.right,
      this.bottom,
      this.textAlign,
      this.text,
      this.textOverflow,
      this.style,
      super.key});

  final String? text;

  final TextAlign? textAlign;
  final TextStyle? style;
  final double? left;
  final double? right;
  final double? top;
  final TextOverflow? textOverflow;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: left ?? zero,
          right: right ?? zero,
          bottom: bottom ?? zero,
          top: top ?? zero),
      child: Text(
        overflow: textOverflow,
        textAlign: textAlign,
        text ?? '',
        style: style ?? Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
