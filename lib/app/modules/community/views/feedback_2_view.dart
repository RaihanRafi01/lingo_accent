import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/auth/custom_button.dart';
import '../../../../common/widgets/call/call_feedback_message.dart';
import '../../dashboard/views/dashboard_view.dart';

class Feedback2View extends GetView {
  const Feedback2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth > constraints.maxHeight
                ? _buildLandscapeLayout()
                : _buildPortraitLayout();
          },
        ),
      ),
    );
  }

  /// Portrait Layout
  Widget _buildPortraitLayout() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _feedbackMessage(),
          Image.asset('assets/images/analytic/avatar_angry.png', scale: 4),
          _okButton(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  /// Landscape Layout
  Widget _buildLandscapeLayout() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(flex: 2, child: _feedbackMessage()),
          Expanded(
              flex: 2,
              child: Image.asset('assets/images/analytic/avatar_angry.png',
                  scale: 3)),
          Expanded(flex: 1, child: _okButton()),
        ],
      ),
    );
  }

  /// Feedback message widget
  Widget _feedbackMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CallFeedbackMessageWidget(
          isMike: false,
          message:
              'I am really disappointed. Seeing your performance like this.',
        ),
      ),
    );
  }

  /// OK button widget
  Widget _okButton() {
    return CustomButton(
      text: 'Ok',
      onPressed: () => Get.offAll(DashboardView(index: 3)),
    );
  }
}
