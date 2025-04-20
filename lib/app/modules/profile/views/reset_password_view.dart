import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/appColors.dart';
import '../../../../common/widgets/auth/custom_button.dart';
import '../../../../common/widgets/customAppBar.dart';
import '../../../../common/widgets/settings/customTextField2.dart';

class ResetPasswordView extends GetView {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents the UI from shifting
      appBar: CustomAppBar(title: 'Reset Password'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField2(
                        labelText: 'Old Password',
                        hintText: '',
                        isPassword: true),
                    SizedBox(height: 20),
                    CustomTextField2(
                        labelText: 'New Password',
                        hintText: '',
                        isPassword: true),
                    SizedBox(height: 20),
                    CustomTextField2(
                        labelText: 'Confirm Password',
                        hintText: '',
                        isPassword: true),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                CustomButton(
                  text: 'Save',
                  onPressed: () {},
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.blue, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Add some spacing from the bottom
          ],
        ),
      ),
    );
  }
}
