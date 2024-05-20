import 'package:flutter/material.dart';
import 'package:to_do/View/Constant/color_utils.dart';
import 'package:to_do/View/Constant/font_utils.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.contentPaddingVertical,
    this.color,
    this.textHintColor,
  });
  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final double? contentPaddingVertical;
  final Color? color;
  final Color? textHintColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: FontUtils.h18(fontColor: textColor),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: borderColor, width: 0.8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: borderColor, width: 0.8),
        ),
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(
            vertical: contentPaddingVertical ?? MediaQuery.of(context).size.height * 0.017,
            horizontal: MediaQuery.of(context).size.width * 0.04),
        hintStyle: FontUtils.h17(fontColor: textHintColor ?? textFieldHintColor),
        fillColor: color ?? textFieldColor,
        filled: true,
      ),
    );
  }
}
