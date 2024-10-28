import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parsonskellogg/core/color/color.dart';
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

TextStyle commonTextStyle(
    {Color? color, FontWeight? fontWeight, double? fontSize}) {
  return GoogleFonts.inter(
      color: color ?? colorText,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: fontSize ?? fourteen);
}

commonTextFieldWithTextView(
    {String? title,
    String? hint,
    bool? readOnly,
    double? top,
    double? fontSize,
    Color? colorFill,
    double? topTextFiled,
    bool? obscureText = false,
    Widget? suffixIcon,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    TextEditingController? controller}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      CommonTextWidget(
        style: commonTextStyle(fontSize: fontSize),
        text: title ?? emailAddress,
        top: top,
      ),
      CommonTextFieldWidget(
        hint: hint,
        readOnly: readOnly,
        colorFill: colorFill,
        controller: controller,
        obscureText: obscureText,
        style: commonTextStyle(fontSize: 13),
        validator: validator,
        suffixIcon: suffixIcon,
        onChanged: onChanged,
        hintStyle: commonTextStyle(
            color: Colors.grey.withOpacity(zero90), fontSize: 13),
        top: topTextFiled ?? five,
      )
    ],
  );
}

BoxDecoration commonBoxDecoration(
    {Color? color,
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

void showCommonDialog(
    {required BuildContext context,
    required String title,
    required String content,
    String? btnPositive,
    String? btnNegative,
    bool isMessage = false,
    VoidCallback? onPressPositive,
    VoidCallback? onPressNegative}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: CommonTextWidget(
              text: title,
              style: commonTextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            content: CommonTextWidget(text: content),
            actions: [
              if (!isMessage)
                CupertinoDialogAction(
                  onPressed: onPressNegative ??
                      () {
                        Navigator.of(context).pop();
                      },
                  child: CommonTextWidget(
                    text: btnNegative ?? no,
                  ),
                ),

              // Show only if isMessage is false
              CupertinoDialogAction(
                onPressed: onPressPositive ??
                    () {
                      Navigator.of(context).pop();
                    },
                child: CommonTextWidget(
                  text: btnPositive ?? okay,
                  style: commonTextStyle(color: Colors.red),
                ),
              ),
            ],
          ));
}

commonTab({String? text, required String icon}) {
  return Tab(
    child: SizedBox(
      height: forty,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(
                icon,
              ),
              size: 24,
            ),
            const SizedBox(
              width: five,
            ),
            Text(
              text ?? "Status",
            ),
          ],
        ),
      ),
    ),
  );
}

commonButtonStyle(
    {Color? color,
    TextStyle? textStyle,
    Color? borderColor,
    double? width,
    double? borderRadius}) {
  return ElevatedButton.styleFrom(
    textStyle: textStyle,
    backgroundColor: color ?? colorButton,
    foregroundColor: color ?? colorButton,
    disabledBackgroundColor: color ?? colorButton,
    disabledForegroundColor: color ?? colorButton,
    shape: RoundedRectangleBorder(
      side: BorderSide(
          color: borderColor ?? Colors.transparent, width: width ?? 0),
      borderRadius: BorderRadius.circular(borderRadius ?? five), // <-- Radius
    ),
    elevation: zero,
  );
}

commonText({
  String? text,
  double? fontSize,
  TextAlign? textAlign,
  FontWeight? fontWeight,
  Color? colorText,
}) {
  return CommonTextWidget(
    text: text,
    textAlign: textAlign,
    style: commonTextStyle(
        fontSize: fontSize ?? 10, color: colorText, fontWeight: fontWeight),
  );
}

commonColText({String? text}) {
  return commonText(
      fontSize: 12,
      text: text ?? user,
      fontWeight: FontWeight.w900,
      colorText: Colors.black.withOpacity(0.7));
}

showAlertDialog(
    {required BuildContext context,
    double? dialogHeight,
    double? dialogWidth,
    required Widget child}) {
  showDialog(
    context: context,
    builder: (context) {
      var size = MediaQuery.sizeOf(context);
      return AlertDialog(
        alignment: Alignment.center,
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        buttonPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        content: SizedBox(
            height: dialogHeight ?? size.height,
            width: dialogWidth ?? size.width * 0.5,
            child: child),
      );
    },
  );
}
