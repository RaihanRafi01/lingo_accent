import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo_accent/app/modules/authentication/views/sign_up_setp_2_view.dart';
import '../../../../common/customFont.dart';
import '../../../../common/widgets/settings/customTextField2.dart';
import '../../../../common/widgets/auth/custom_button.dart';
import '../controllers/authentication_controller.dart';

class SignUpSetp1View extends StatelessWidget {
  const SignUpSetp1View({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final AuthenticationController signUpController =
        Get.put(AuthenticationController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 56),
              Obx(() {
                if (signUpController.isPasswordStep.value) {
                  // Show password input first
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create your Password',
                        style: h3.copyWith(fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      CustomTextField2(
                        hintText: 'Enter your password',
                        labelText: "Password",
                        startIconPath: "assets/images/auth/key_icon.svg",
                        isPassword: true,
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Your password must contain 8 characters, 1 uppercase and 1 number.',
                        style: h1.copyWith(fontSize: 16),
                      ),
                    ],
                  );
                } else {
                  // Show username input after clicking continue
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create your User Name',
                        style: h3.copyWith(fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      CustomTextField2(
                        hintText: '@your name',
                        labelText: "User Name",
                        startIconPath: "assets/images/auth/person_icon.svg",
                        // Start icon
                        isPassword: false,
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Create a unique username, you can use numbers from 0 to 9 and underscores and dashes',
                        style: h1.copyWith(fontSize: 16),
                      ),
                    ],
                  );
                }
              }),
              Spacer(), // This ensures the button is pushed to the bottom
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  // Move to the next step (show username input)

                  if (signUpController.isPasswordStep.value) {
                    print('a');
                    Get.to(SignUpStep2View());
                    //signUpController.isPasswordStep.value= false;
                  } else if (!signUpController.isPasswordStep.value) {
                    print('b');
                    signUpController.isPasswordStep.value = true;
                  }
                  //signUpController.isPasswordStep.value = !signUpController.isPasswordStep.value;
                },
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
