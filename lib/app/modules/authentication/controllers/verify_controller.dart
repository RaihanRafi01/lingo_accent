import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/forgot_password_view.dart';

class VerifyController extends GetxController {
  // Observables
  var showOTPField = false.obs;
  var otpControllers = List.generate(4, (index) => TextEditingController()).obs;
  var otpFocusNodes = List.generate(4, (index) => FocusNode()).obs;

  // Toggle between email/mobile and OTP fields
  void toggleOTPField() {
    showOTPField.value = !showOTPField.value;
  }

  // Handle OTP input changes
  void onOTPChanged(int index, String value) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(Get.context!).requestFocus(otpFocusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(Get.context!).requestFocus(otpFocusNodes[index - 1]);
    }
  }

  // Verify OTP
  void verifyOTP() {
    String otp = otpControllers.map((controller) => controller.text).join();
    print('Entered OTP: $otp');
    Get.to(ForgotPasswordView());
    // Add your OTP verification logic here
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in otpFocusNodes) {
      focusNode.dispose();
    }
    super.onClose();
  }
}
