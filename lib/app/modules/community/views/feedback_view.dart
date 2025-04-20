import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/appColors.dart';
import '../../../../common/widgets/auth/custom_button.dart';
import '../../../../common/widgets/call/call_feedback_message.dart';
import 'feedback_2_view.dart';

class FeedbackView extends GetView {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-Screen Glow Image
          Positioned.fill(
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/nav/glow.png',
              ),
            ),
          ),

          // Content Layer (Messages + Button)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Centered Title
                  Text(
                    'AI Feedback',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Messages Section (Scrollable)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CallFeedbackMessageWidget(
                                message: 'Hello, I am AI feedback.',
                                coloredWords: {
                                  'Hello,': Colors.blue,
                                  'feedback.': Colors.red,
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CallFeedbackMessageWidget(
                                message: 'This is another AI message.',
                                coloredWords: {
                                  'another': Colors.green,
                                  'message.': Colors.orange,
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CallFeedbackMessageWidget(
                                message: 'Hello, I am AI feedback.',
                                coloredWords: {
                                  'Hello,': Colors.blue,
                                  'feedback.': Colors.red,
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CallFeedbackMessageWidget(
                                message: 'This is another AI message.',
                                coloredWords: {
                                  'another': Colors.green,
                                  'message.': Colors.orange,
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CallFeedbackMessageWidget(
                                message: 'This is another AI message.',
                                coloredWords: {
                                  'another': Colors.green,
                                  'message.': Colors.orange,
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Button (Above Glow)
                  CustomButton(
                      text: 'Feedback',
                      onPressed: () {
                        Get.to(Feedback2View());
                      }),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
