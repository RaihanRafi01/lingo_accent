import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/appColors.dart';
import '../../../../common/customFont.dart';
import '../../../../common/widgets/customAppBar.dart';

class TermsPrivacyView extends GetView {
  final bool isTerms;

  const TermsPrivacyView({required this.isTerms, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(title: isTerms ? 'Terms & Condition' : 'Privacy policy'),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
            // Make the text scrollable
            child: Text(
              isTerms
                  ? 'Terms and Conditions By using the Business Coach Chatbot, you agree to the following terms: The chatbot provides general business guidance and advice but is not a substitute for professional consulting services. We offer both free and paid subscription plans. Paid plans are billed on a recurring basis unless canceled. User data is handled securely and in accordance with our Privacy Policy. We are not responsible for decisions made based on the chatbot\'s advice or any resulting outcomes. Misuse of the service or violation of these terms may result in termination of access. By continuing to use the chatbot, you accept these terms. For questions, contact our support team.'
                  : 'Terms and Conditions By using the Business Coach Chatbot, you agree to the following terms: The chatbot provides general business guidance and advice but is not a substitute for professional consulting services. We offer both free and paid subscription plans. Paid plans are billed on a recurring basis unless canceled. User data is handled securely and in accordance with our Privacy Policy. We are not responsible for decisions made based on the chatbot\'s advice or any resulting outcomes. Misuse of the service or violation of these terms may result in termination of access. By continuing to use the chatbot, you accept these terms. For questions, contact our support team.',
              style: h3.copyWith(height: 2, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
