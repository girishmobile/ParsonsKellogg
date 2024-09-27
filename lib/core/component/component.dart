import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parsonskellogg/core/common/common_text_field_widget.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';

commonInkWell({Widget? child, VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: child,
  );
}

commonVerticalLine({double? indent, double? endIndent}) {
  return VerticalDivider(
    indent: indent ?? ten,
    endIndent: endIndent ?? ten,
  );
}

loadAssetImage({required String path, double? width, double? height}) {
  return Image.asset(
    path,
    width: width,
    height: height,
  );
}

commonTextFieldWithTextView(
    {String? title, String? hint, double? top, double? topTextFiled, bool? obscureText = false, Widget? suffixIcon, void Function(String)? onChanged, String? Function(String?)? validator, TextEditingController? controller}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      CommonTextWidget(
        text: title ?? emailAddress,
        top: top,
      ),
      CommonTextFieldWidget(
        hint: hint,
        controller
        :controller,
        obscureText: obscureText,
        validator: validator,
        suffixIcon: suffixIcon,
        onChanged: onChanged,

        hintStyle: GoogleFonts.outfit(color: Colors.grey.withOpacity(zero90)),
        top: topTextFiled ?? five,
      )
    ],
  );
}

BoxDecoration commonBoxDecoration({Color? color,
  BoxBorder? border,
  BoxShape shape = BoxShape.rectangle,
  BorderRadiusGeometry? borderRadius,
  DecorationImage? image}) {
  return BoxDecoration(
      color: color,
      image: image,
      border: border,
      shape: shape,
      borderRadius: borderRadius);
}

