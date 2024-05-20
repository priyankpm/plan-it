import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/Controller/auth_controller.dart';
import 'package:to_do/View/Constant/app_strings.dart';
import 'package:to_do/View/Constant/color_utils.dart';
import 'package:to_do/View/Widgets/app_text.dart';
import 'package:to_do/View/Widgets/common_button.dart';
import 'package:to_do/View/Widgets/common_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: themeColor,
      body: SafeArea(
        child: GetBuilder<AuthController>(builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.07, bottom: height * 0.08),
                  child: appText(
                    title: AppString.login,
                    fontSize: height * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(
                      title: AppString.phoneNumber,
                      fontSize: height * 0.017,
                      fontWeight: FontWeight.w400,
                      color: textColor.withOpacity(0.87),
                    ),
                    SizedBox(height: height * 0.012),
                    CommonTextField(
                      controller: controller.phoneNumber,
                      hint: AppString.enterPhoneNumber,
                      keyboardType: const TextInputType.numberWithOptions(),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.06),
                  child: CommonFullButton(
                      isLoading: authController.loader,
                      onPressed: () async {
                        await controller.sendOTP(controller.phoneNumber.text, context);
                      },
                      title: AppString.sendOtp),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
