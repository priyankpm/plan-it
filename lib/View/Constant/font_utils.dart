import 'package:flutter/material.dart';
import 'package:to_do/View/Constant/color_utils.dart';

enum FWT {
  bold,
  semiBold,
  medium,
  regular,
  lightMedium,
  light,
}

class FontUtils {
  static FontWeight getFontWeight(FWT fwt) {
    switch (fwt) {
      case FWT.light:
        return FontWeight.w200;
      case FWT.lightMedium:
        return FontWeight.w300;
      case FWT.regular:
        return FontWeight.w400;
      case FWT.medium:
        return FontWeight.w500;
      case FWT.semiBold:
        return FontWeight.w600;
      case FWT.bold:
        return FontWeight.w900;
    }
  }

  static TextStyle h6({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 6,
    );
  }

  static TextStyle h8({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 8,
    );
  }

  static TextStyle h10({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 10,
    );
  }

  static TextStyle h12({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 12,
    );
  }

  static TextStyle h14({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 14,
    );
  }

  static TextStyle h15({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 15,
    );
  }

  static TextStyle h16({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 16,
    );
  }

  static TextStyle h17({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 17,
    );
  }

  static TextStyle h18({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
        color: fontColor ?? textColor,
        fontWeight: getFontWeight(fontWeight),
        fontSize: 18,
        decoration: TextDecoration.none);
  }

  static TextStyle h20({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 20,
    );
  }

  static TextStyle h22({
    required Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 22,
    );
  }

  static TextStyle h24({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 24,
    );
  }

  static TextStyle h26({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 26,
    );
  }

  static TextStyle h28({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 28,
    );
  }

  static TextStyle h34({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 34,
    );
  }

  static TextStyle h40({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 40,
    );
  }

  static TextStyle h48({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? textColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 48,
    );
  }
}
