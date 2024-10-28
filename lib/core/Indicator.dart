import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
     this.isSquare=false,
    this.size = 12,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool? isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare==true ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: CommonTextWidget(
          
            textAlign: TextAlign.start, // Center text within the Indicator
            textOverflow: TextOverflow.visible, // Allows text to wrap
            softWrap: true, // Enables text wrapping
            maxLines: 4, // Optional: limits the number of lines
          text:   text,
            style: commonTextStyle(
              fontSize: 10,
          
          
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}