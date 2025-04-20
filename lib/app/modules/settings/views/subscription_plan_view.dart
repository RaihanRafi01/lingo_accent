import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo_accent/app/modules/settings/views/terms_privacy_view.dart';
import '../../../../common/appColors.dart';
import '../../../../common/customFont.dart';
import '../../../../common/widgets/auth/custom_button.dart';

class SubscriptionPlanView extends StatefulWidget {
  const SubscriptionPlanView({super.key});

  @override
  _SubscriptionPlanViewState createState() => _SubscriptionPlanViewState();
}

class _SubscriptionPlanViewState extends State<SubscriptionPlanView> {
  // Variable to track selected plan
  String? _selectedPlan = 'MONTHLY';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Subscription',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back(); // Navigates back using GetX
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity, // Make the container full width
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.settingsCard,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            border: Border.all(color: AppColors.blue4, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Unlock Premium',
                  style: h1.copyWith(
                    fontSize: 26,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Access all stations, unlimited playlists, and more!',
                  style: h3.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                _buildFeatureItem(
                    'Real-time speech recognition and feedback on pronunciation, rhythm, and intonation.'),
                _buildFeatureItem(
                    'Gamified exercises with daily and weekly challenges.'),
                _buildFeatureItem(
                    '5 sessions per month for real-time practice and feedback.'),
                _buildFeatureItem(
                    'AI tutor assistance for basic questions and tips (limited to 20 interactions per month).'),
                const SizedBox(height: 20),
                _buildSubscriptionOption('MONTHLY', '\$4.99/month', 'MONTHLY'),
                SizedBox(height: 10),
                _buildSubscriptionOption(
                    'YEARLY', '\$44.99/year', 'YEARLY', 'Save 25%'),
                const SizedBox(height: 20),
                CustomButton(text: 'Buy', onPressed: () {}),
                const SizedBox(height: 8),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Add logic for "Not Now" button here
                    },
                    child: const Text(
                      'Not Now',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Terms and Conditions
                Text.rich(
                  TextSpan(
                    text:
                        'Terms and conditions apply. Subscriptions will be charged via your iTunes account. ',
                    style: const TextStyle(color: Colors.white70),
                    children: [
                      TextSpan(
                        text: 'Terms of Use',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to the Terms of Use page
                            Get.to(() => const TermsPrivacyView(isTerms: true));
                          },
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to the Privacy Policy page
                            Get.to(
                                () => const TermsPrivacyView(isTerms: false));
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_box_rounded, size: 20, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: h4.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionOption(String title, String price, String planKey,
      [String? discount]) {
    final isSelected = _selectedPlan == planKey;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? AppColors.blue3 : Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
        color:
            isSelected ? AppColors.blue2.withOpacity(0.1) : Colors.transparent,
      ),
      child: Stack(
        clipBehavior: Clip.none, // Allow the text to overflow if necessary
        children: [
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
            leading: Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: isSelected ? AppColors.blue3 : Colors.grey,
                    width: 2),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: AppColors.blue3, size: 16)
                  : null,
            ),
            title: Row(
              children: [
                Text(
                  title,
                  style: h1.copyWith(
                    fontSize: 18,
                    color: isSelected ? AppColors.blue3 : Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  price,
                  style: h4.copyWith(
                    fontSize: 16,
                    color: isSelected ? AppColors.blue3 : Colors.white,
                  ),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                _selectedPlan = planKey; // Update selected plan
              });
            },
          ),
          if (discount != null)
            Positioned(
              top: -15,
              right: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: AppColors.blue3,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  discount,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
