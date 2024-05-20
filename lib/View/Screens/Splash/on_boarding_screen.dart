import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do/Controller/on_boarding_controller.dart';
import 'package:to_do/View/Constant/app_assets.dart';
import 'package:to_do/View/Constant/app_strings.dart';
import 'package:to_do/View/Constant/color_utils.dart';
import 'package:to_do/View/Screens/Authentication/login_screen.dart';
import 'package:to_do/View/Widgets/app_text.dart';
import 'package:to_do/View/Widgets/common_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  OnBoardingController onBoardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: themeColor,
      body: GetBuilder<OnBoardingController>(
        builder: (controller) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: controller.controller,
                  onPageChanged: (value) {
                    setState(() {
                      controller.controller
                          .animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
                      controller.currentPage = value;
                    });
                  },
                  allowImplicitScrolling: true,
                  pageSnapping: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.walkthroughData.length,
                  physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.1, bottom: height * 0.1),
                        child: Center(
                          child: Image.asset(
                            controller.walkthroughData[index]['image'],
                            height: height * 0.4,
                            width: width * 0.7,
                          ),
                        ),
                      ),
                      appText(
                          title: controller.walkthroughData[index]['title'],
                          fontSize: height * 0.035,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      SizedBox(
                        width: width * 0.75,
                        child: appText(
                            title: controller.walkthroughData[index]['subTitle'],
                            fontSize: height * 0.017,
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ),
              ),
              controller.currentPage == 2
                  ? const SizedBox()
                  : Positioned(
                      left: width * 0.04,
                      top: MediaQuery.of(context).size.height * 0.05,
                      child: GestureDetector(
                        onTap: () {
                          Get.offAll(() => const LoginScreen(), transition: Transition.fadeIn);
                        },
                        child: appText(
                          title: AppString.skip.toUpperCase(),
                          fontSize: 18,
                          color: lightTextColor,
                        ),
                      ),
                    ),
              Positioned(
                left: 0,
                right: 0,
                top: height * 0.57,
                child: Center(
                  child: _indicator(controller),
                ),
              ),
              Positioned(
                bottom: height * 0.06,
                left: width * 0.06,
                right: width * 0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.currentPage != 0) {
                          controller.jumpToPreviousPage();
                        }
                      },
                      child: appText(
                        title: AppString.back.toUpperCase(),
                        fontSize: height * 0.018,
                        color: lightTextColor,
                      ),
                    ),
                    CommonButton(
                      onPressed: () {
                        if (controller.currentPage == 2) {
                          Get.offAll(() => const LoginScreen(), transition: Transition.fadeIn);
                        } else {
                          controller.jumpToPage();
                        }
                      },
                      title: controller.currentPage == 2
                          ? AppString.getStarted.toUpperCase()
                          : AppString.next.toUpperCase(),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _indicator(OnBoardingController controller) {
    return SmoothPageIndicator(
      controller: controller.controller,
      count: controller.walkthroughData.length,
      effect: WormEffect(
          dotHeight: MediaQuery.of(context).size.height * 0.005,
          dotWidth: MediaQuery.of(context).size.height * 0.025,
          spacing: MediaQuery.of(context).size.height * 0.006,
          activeDotColor: primaryColor,
          dotColor: appGrey),
    );
  }
}
