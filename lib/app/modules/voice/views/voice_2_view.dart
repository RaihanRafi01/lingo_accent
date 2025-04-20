import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/appColors.dart';
import '../../../../common/customFont.dart';
import '../../../../common/widgets/auth/custom_button.dart';

class Voice2View extends GetView {
  const Voice2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: AppColors.audioCard),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.cardBlurtext,
                        // Set your desired border color here
                        width: 1, // Set your desired border width
                      ),
                    ),
                    child: Text(
                        style: h2.copyWith(fontSize: 16),
                        'I was very pleased with your performance today. However, I think you need to be a little more careful with your pronunciation.'),
                  ),
                  Image.asset(
                    'assets/images/voice/voice_avatar_2.png',
                    scale: 4,
                  ),
                  CustomButton(text: 'Ok', onPressed: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
