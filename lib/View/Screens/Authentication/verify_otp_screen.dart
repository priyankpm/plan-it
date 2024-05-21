import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:to_do/Controller/auth_controller.dart';
import 'package:to_do/View/Constant/app_strings.dart';
import 'package:to_do/View/Constant/color_utils.dart';
import 'package:to_do/View/Constant/show_toast.dart';
import 'package:to_do/View/Widgets/app_text.dart';
import 'package:to_do/View/Widgets/common_button.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.mobileNumber});
  final String mobileNumber;
  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  AuthController authController = Get.put(AuthController());
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  TextEditingController otpController = TextEditingController();

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
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: textColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.06, bottom: height * 0.08),
                  child: appText(
                    title: AppString.verifyOtp,
                    fontSize: height * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.02),
                  child: appText(
                    title: '${AppString.sendOtpOnMobileNumber}${widget.mobileNumber}',
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: const TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter",
                    fontSize: 16,
                  ),
                  length: 6,
                  obscureText: false,
                  obscuringCharacter: '*',
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    borderWidth: 0.9,
                    activeColor: primaryColor,
                    fieldHeight: height * 0.06,
                    fieldWidth: width * 0.12,
                    activeBorderWidth: 0.9,
                    activeFillColor: textColor,
                    selectedBorderWidth: 0.9,
                    disabledBorderWidth: 0.9,
                    inactiveBorderWidth: 0.9,
                    errorBorderWidth: 0.9,
                    inactiveColor: borderColor,
                    inactiveFillColor: textFieldColor,
                    selectedFillColor: primaryColor,
                    selectedColor: primaryColor,
                  ),
                  cursorColor: primaryColor,
                  animationDuration: const Duration(milliseconds: 300),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: false,
                  errorAnimationController: errorController,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  // boxShadows: boxShadow(),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.06),
                  child: CommonFullButton(
                    isLoading: controller.loader,
                    onPressed: () {
                      if (otpController.text.isNotEmpty) {
                        controller.verifyOTP(otpController.text, context);
                      } else {
                        showErrorToast('Please Enter Otp');
                      }
                    },
                    title: AppString.verifyOtp,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
