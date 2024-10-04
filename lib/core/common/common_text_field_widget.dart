import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';

class CommonTextFieldWidget extends StatelessWidget {
  const CommonTextFieldWidget(
      {super.key,
      this.hint,
      this.controller,
      this.suffixIcon,
      this.onChanged,
      this.obscureText = false,
      this.bottom,
      this.right,
      this.left,
      this.hintStyle,
      this.validator,
      this.style,
      this.colorFill,
      this.borderRadius,
      this.readOnly = false,
      this.top,
      this.prefixIcon});

  final String? hint;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final bool? readOnly;
  final double? left;
  final double? right;
  final double? top;
  final double? borderRadius;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final double? bottom;
  final Color? colorFill;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);

    // Set border color based on the theme mode
  //  final borderColor = theme.brightness == Brightness.dark ? Colors.black : Colors.grey.withOpacity(0.20);
  //  final colorFill = theme.brightness == Brightness.dark ?colorDarkFillColor : Colors.white;

    return Container(
      margin: EdgeInsets.only(
          left: left ?? zero,
          right: right ?? zero,
          bottom: bottom ?? zero,
          top: top ?? zero),
      decoration: BoxDecoration(
        color: Colors.white, // <--- change this
        borderRadius: BorderRadius.circular(eight),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        validator: validator,
        controller: controller,
        readOnly: readOnly ?? false,
        autocorrect: false,
        style: style ?? Theme.of(context).textTheme.bodySmall,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium,
          focusedBorder: commonBorderView(borderColor: Colors.green),
          enabledBorder: commonBorderView(),
          filled: true,
          // <-- add filled
          //  fillColor: Colors.white,
          // <--- and this

          fillColor: colorFill,

          border: commonBorderView(),
        ),
      ),
    );
  }

  commonBorderView({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? ten),
      borderSide: BorderSide(
        color: borderColor ?? Colors.black.withOpacity(0.20),
        width: one,
      ),
    );
  }
}
