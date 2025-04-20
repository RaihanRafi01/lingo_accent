import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo_accent/app/modules/authentication/views/sign_up_setp_1_view.dart';
import 'package:lingo_accent/app/modules/authentication/views/verify_view.dart';
import '../../../../common/customFont.dart';
import '../../../../common/widgets/auth/customBlurBackground.dart';
import '../../../../common/widgets/auth/custom_button.dart';
import '../../../../common/widgets/auth/custom_textField.dart';
import '../../../../common/widgets/svgIcon.dart';
import 'authentication_view.dart';

class SignUpView extends GetView {
  const SignUpView({super.key});

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
                'Sign Up',
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
            CustomTextField(hint: 'Full Name'),
            // Password TextField
            CustomTextField(hint: 'E-mail or Mobile Number'),
            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.to(VerifyView());
                }, // Add your forgot password functionality
                child: Text(
                  'Forgot Password?',
                  style: h4.copyWith(color: Colors.red),
                ),
              ),
            ),

            const SizedBox(height: 10),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'By creating an account, I accept the ',
                    style: h4.copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: h4.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        /*_showBottomSheet(
                          "Terms & Conditions",
                          "Here are the detailed terms and conditions for the app...",
                        );*/
                      },
                  ),
                  TextSpan(
                    text: ' & ',
                    style: h4.copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: h4.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        /*_showBottomSheet(
                          "Privacy Policy",
                          "Here are the privacy policies of the app...",
                        );*/
                      },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Login Button
            CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  Get.offAll(SignUpSetp1View());
                }),

            // Terms and conditions
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Joined us before?  ',
                    style: h4.copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Log In',
                    style: h4.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(AuthenticationView());
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Or',
              style: h4.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgIcon(
                    svgPath: 'assets/images/auth/google_icon.svg',
                    onTap: () {},
                    height: 24),
                SizedBox(
                  width: 20,
                ),
                SvgIcon(
                    svgPath: 'assets/images/auth/apple_icon.svg',
                    onTap: () {},
                    height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
