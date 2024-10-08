import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';

import '../constants/num_constants.dart';

class CommonDropDownView extends StatelessWidget {
  const CommonDropDownView(
      {super.key,
      required this.size,
      this.hint,
      this.decoration,
      this.horizontal,
      this.onChanged,
      this.hintColor,
      this.height,
      required this.items,
      this.selectedValue});
  final Size size;
  final String? hint;
  final BoxDecoration? decoration;
  final Color? hintColor;
  final String? selectedValue;
  final double? height;
  final double? horizontal;
  final void Function(String?)? onChanged;
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isDense: true,
        isExpanded: true,

        dropdownStyleData: DropdownStyleData(
          offset: const Offset(-0, -5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(fourteen),
            color: Colors.white,
          ),
        ),
        alignment: Alignment.center,
        hint: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: CommonTextWidget(
                  text: hint ?? 'Select Item',
                  left: horizontal != null ? ten : twenty,
          
                ),
              ),
              const VerticalDivider(
                color: Colors.grey,
                thickness: 1,
              ),

            ],
          ),
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: CommonTextWidget(
                    text: item,
                    left: horizontal != null ? ten : twenty,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          decoration: decoration ??
              BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(eight),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.30),
                ),
                //color: Colors.redAccent,
              ),
          padding: EdgeInsets.symmetric(horizontal: horizontal ?? 0),
          height: height ?? fifty,
          width: size.width * 0.7,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: height ?? fifty,
        ),
      ),
    );
  }
}
