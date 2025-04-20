import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/appColors.dart';
import '../../../../common/customFont.dart';
import '../../../../common/widgets/auth/customBlurBackground.dart';
import '../../../../common/widgets/auth/custom_button.dart';
import '../../../../common/widgets/auth/custom_textField.dart';
import '../controllers/verify_controller.dart';

class VerifyView extends StatelessWidget {
  final VerifyController verifyController = Get.put(VerifyController());

  VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlurredBackground(
        child: Obx(() {
          final showOTP = verifyController.showOTPField.value;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  showOTP ? 'Verify OTP' : 'Verify',
                  style: h1.copyWith(fontSize: 30, color: Colors.white),
                ),
              ),
              const SizedBox(height: 50),
              showOTP
                  ? _buildOTPField()
                  : CustomTextField(hint: 'E-mail or Mobile Number'),
              const SizedBox(height: 50),
              CustomButton(
                text: showOTP ? 'VERIFY OTP' : 'GET OTP',
                onPressed: () {
                  if (showOTP) {
                    verifyController.verifyOTP();
                  } else {
                    verifyController.toggleOTPField();
                  }
                },
              ),
              const SizedBox(height: 50),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildOTPField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return SizedBox(
          width: 50,
          child: Obx(() => TextField(
                cursorColor: AppColors.blurtext,
                controller: verifyController.otpControllers[index],
                focusNode: verifyController.otpFocusNodes[index],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  counterText: '',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                onChanged: (value) =>
                    verifyController.onOTPChanged(index, value),
              )),
        );
      }),
    );
  }
}
