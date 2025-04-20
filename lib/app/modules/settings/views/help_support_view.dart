import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/auth/custom_button.dart';
import '../../../../common/widgets/customAppBar.dart';
import '../../../../common/widgets/settings/customTextField2.dart';
import '../controllers/settings_controller.dart';

class HelpSupportView extends GetView<SettingsController> {
  HelpSupportView({super.key});

  final emailController = TextEditingController(); // Text controllers
  final problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Help & Support'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;
          return isLandscape ? _buildLandscapeLayout() : _buildPortraitLayout();
        },
      ),
    );
  }

  /// Portrait Mode Layout
  Widget _buildPortraitLayout() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _inputFields(),
            const SizedBox(height: 50),
            _sendButton(),
          ],
        ),
      ),
    );
  }

  /// Landscape Mode Layout (Row-based)
  Widget _buildLandscapeLayout() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(flex: 2, child: _inputFields()), // Input fields section
            const SizedBox(width: 16),
            Expanded(flex: 1, child: _sendButton()), // Send button
          ],
        ),
      ),
    );
  }

  /// Input Fields Section
  Widget _inputFields() {
    return Column(
      children: [
        CustomTextField2(
          controller: emailController,
          labelText: '',
          hintText: 'Email',
        ),
        const SizedBox(height: 20),
        CustomTextField2(
          controller: problemController,
          maxLine: 6,
          labelText: '',
          hintText: 'Description',
        ),
      ],
    );
  }

  /// Send Button
  Widget _sendButton() {
    return Center(
      child: CustomButton(
        width: 150,
        text: 'Send',
        onPressed: _validateAndSend,
      ),
    );
  }

  /// Validation & Sending Logic
  void _validateAndSend() {
    final email = emailController.text.trim();
    final problem = problemController.text.trim();

    if (email.isEmpty || problem.isEmpty) {
      _showSnackbar('Error', 'Please fill out all fields');
      return;
    }

    if (!_isValidEmail(email)) {
      _showSnackbar('Error', 'Please enter a valid email address');
      return;
    }

    // settingController.helpAndSupport(email, problem);
  }

  /// Email Validation
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailRegex.hasMatch(email);
  }

  /// Snackbar Notification
  void _showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}
