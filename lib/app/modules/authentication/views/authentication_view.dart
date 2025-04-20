import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo_accent/app/modules/authentication/views/sign_up_view.dart';
import 'package:lingo_accent/app/modules/authentication/views/verify_view.dart';
import '../../../../common/customFont.dart';
import '../../../../common/widgets/auth/customBlurBackground.dart';
import '../../../../common/widgets/auth/custom_button.dart';
import '../../../../common/widgets/auth/custom_textField.dart';
import '../../../../common/widgets/svgIcon.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({super.key});

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
                'Log In',
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
            CustomTextField(hint: 'E-mail or Mobile Number'),
            // Password TextField
            CustomTextField(hint: 'Password'),
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
            // Login Button
            CustomButton(
                text: 'Login',
                onPressed: () {
                  Get.offAll(DashboardView());
                }),

            // Terms and conditions
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Dont\'t have an account ?  ',
                    style: h4.copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Sign Up',
                    style: h4.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(SignUpView());
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
