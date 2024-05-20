import 'package:flutter/material.dart';
import 'package:to_do/View/Constant/color_utils.dart';

Text appText(
    {required String title,
    double fontSize = 12,
    int? maxLines,
    FontWeight fontWeight = FontWeight.w400,
    Color color = textColor,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
    Color? decorationColor}) {
  return Text(
    title,
    textAlign: textAlign,
    maxLines: maxLines,
    style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'Inter',
        fontWeight: fontWeight,
        overflow: textOverflow,
        decoration: textDecoration,
        decorationColor: decorationColor),
  );
}
