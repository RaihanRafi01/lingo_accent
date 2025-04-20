import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/customFont.dart';
import '../../../../common/widgets/auth/customBlurBackground.dart';
import '../../../../common/widgets/auth/custom_button.dart';
import '../../../../common/widgets/auth/custom_textField.dart';
import 'authentication_view.dart';

class ForgotPasswordView extends GetView {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Set the background color to match the design
      body: BlurredBackground(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Reset Password',
                style: h1.copyWith(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Email or Mobile Number TextField
            CustomTextField(hint: 'Password'),
            // Password TextField
            CustomTextField(hint: 'Confirm Password'),
            SizedBox(
              height: 50,
            ),
            CustomButton(
                text: 'Reset Password',
                onPressed: () {
                  Get.offAll(AuthenticationView());
                }),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
