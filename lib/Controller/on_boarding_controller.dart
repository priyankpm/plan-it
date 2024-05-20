import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/View/Constant/app_assets.dart';
import 'package:to_do/View/Constant/app_strings.dart';

class OnBoardingController extends GetxController {
  jumpToPage() {
    currentPage = currentPage + 1;
    controller.animateToPage(currentPage, duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    update();
  }

  jumpToPreviousPage() {
    currentPage = currentPage - 1;
    controller.animateToPage(currentPage, duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    update();
  }

  int currentPage = 0;
  final controller = PageController(keepPage: true);

  List<Map<String, dynamic>> walkthroughData = [
    {'image': AppAssets.onBoard1, 'title': AppString.onBoard1, 'subTitle': AppString.onBoardSubtitle1},
    {'image': AppAssets.onBoard2, 'title': AppString.onBoard2, 'subTitle': AppString.onBoardSubtitle2},
    {'image': AppAssets.onBoard3, 'title': AppString.onBoard3, 'subTitle': AppString.onBoardSubtitle3},
  ];
}
