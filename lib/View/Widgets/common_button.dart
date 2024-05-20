import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:to_do/View/Constant/color_utils.dart';
import 'package:to_do/View/Widgets/app_text.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isLoading;
  final Color? color;
  final Color? fontColor;
  final bool? isDisabled;
  final double? fontSize;
  final double borderRadius;
  final FontWeight fontWeight;
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.fontColor,
    this.fontSize,
    this.borderRadius = 4,
    this.fontWeight = FontWeight.w400,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.048, vertical: h * 0.013),
        decoration: BoxDecoration(
          color: color ?? lightPrimary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: appText(
            title: title,
            color: fontColor ?? textColor,
            fontWeight: fontWeight,
            fontSize: fontSize ?? MediaQuery.of(context).size.height * 0.018,
          ),
        ),
      ),
    );
  }
}

class CommonFullButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isLoading;
  final Color? color;
  final Color? fontColor;
  final bool? isDisabled;
  final bool? showBorder;
  final double? fontSize;
  final double borderRadius;
  final FontWeight fontWeight;
  const CommonFullButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.fontColor,
    this.fontSize,
    this.borderRadius = 4,
    this.fontWeight = FontWeight.w400,
    this.isDisabled = false,
    this.isLoading = false,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: w,
        padding: EdgeInsets.symmetric(horizontal: w * 0.048, vertical: isLoading == true ? 0 : h * 0.017),
        decoration: BoxDecoration(
          color: showBorder == true ? Colors.transparent : color ?? lightPrimary,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: showBorder == true ? primaryColor : Colors.transparent,
            width: showBorder == true ? 0.8 : 0,
          ),
        ),
        child: Center(
          child: isLoading == true
              ? const CommonButtonCircular()
              : appText(
                  title: title,
                  color: fontColor ?? textColor,
                  fontWeight: fontWeight,
                  fontSize: fontSize ?? MediaQuery.of(context).size.height * 0.02,
                ),
        ),
      ),
    );
  }
}

class CommonButtonCircular extends StatelessWidget {
  const CommonButtonCircular({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.prograssiveDots(
        color: Colors.white,
        size: MediaQuery.of(context).size.height * 0.065,
      ),
    );
  }
}
