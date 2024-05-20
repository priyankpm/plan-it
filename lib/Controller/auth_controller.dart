import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do/View/Constant/shared_preference.dart';
import 'package:to_do/View/Constant/show_toast.dart';
import 'package:to_do/View/Screens/Authentication/verify_otp_screen.dart';
import 'package:to_do/View/Screens/Task/task_screen.dart';

class AuthController extends GetxController {
  TextEditingController phoneNumber = TextEditingController();
  String verificationID = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loader = false;
  setShowLoader(bool value) {
    loader = value;
    update();
  }

  /// SEND OTP METHOD
  Future<void> sendOTP(String phoneNumber, BuildContext context) async {
    try {
      setShowLoader(true);
      await auth.verifyPhoneNumber(
        phoneNumber: "+91$phoneNumber",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          print('Verification completed');
        },
        verificationFailed: (FirebaseAuthException e) {
          setShowLoader(false);
          showErrorToast('Verification failed: ${e.message}');
          // Handle verification failed
          if (e.code == 'invalid-phone-number') {
            showErrorToast("Invalid MobileNumber");
          } else if (e.code == 'missing-phone-number') {
            showErrorToast("Missing Phone Number");
            log('Missing Phone Number');
          } else if (e.code == 'user-disabled') {
            showErrorToast("Number is Disabled");
          } else if (e.code == 'quota-exceeded') {
            showErrorToast("You try too many time. try later ");
          } else if (e.code == 'captcha-check-failed') {
            showErrorToast("Try Again");
          } else {
            log('Verification Failed!');
          }
          // showErrorToast("Verification failed try with another number");
        },
        codeSent: (String verificationId, int? resendToken) {
          setShowLoader(false);
          verificationID = verificationId;
          showToast("OTP sent successfully.");

          Get.to(() => VerifyOtpScreen(mobileNumber: phoneNumber), transition: Transition.fadeIn);

          // ADD NAVIGATION OF VERIFICATION SCREEN
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setShowLoader(false);
        },
      );
    } catch (e) {
      log('e :::::::::::::::::: $e');
      setShowLoader(false);
    }
  }

  /// VERIFY OTP METHOD
  Future<void> verifyOTP(String otp, BuildContext context) async {
    setShowLoader(true);
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID.toString(),
        smsCode: otp,
      );
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential? userCredential = await auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        setShowLoader(false);
        showToast('Otp Verify Successfully');
        await preferences.putBool("isLogin", true);
        Get.offAll(() => const TaskScreen(), transition: Transition.fadeIn);

        /// ADD LOGIC FOR STORE DATA OR NAVIGATE TO NEXT SCREEN
      } else {
        setShowLoader(false);
        // _preferences.setBool("token", false);
        showErrorToast("OTP verification failed");
      }
    } catch (e) {
      // _preferences.setBool("token", false);
      setShowLoader(false);
      showErrorToast("OTP verification failed");
    }
  }
}
