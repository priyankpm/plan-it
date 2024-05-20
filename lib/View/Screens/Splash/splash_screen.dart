import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/View/Constant/app_assets.dart';
import 'package:to_do/View/Constant/color_utils.dart';
import 'package:to_do/View/Constant/shared_preference.dart';
import 'package:to_do/View/Screens/Splash/on_boarding_screen.dart';
import 'package:to_do/View/Screens/Task/task_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      if (preferences.getBool('isLogin') == true) {
        Get.offAll(() => const TaskScreen(), transition: Transition.fadeIn);
      } else {
        Get.offAll(() => const OnBoardingScreen(), transition: Transition.fadeIn);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: themeColor,
      body: Center(
        child: Image.asset(
          AppAssets.logo,
          height: height * 0.25,
        ),
      ),
    );
  }
}
