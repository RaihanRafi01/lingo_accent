import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lingo_accent/app/modules/settings/views/subscription_view.dart';
import 'package:lingo_accent/app/modules/settings/views/terms_privacy_view.dart';
import '../../../../common/appColors.dart';
import '../../../../common/customFont.dart';
import '../controllers/settings_controller.dart';
import 'help_support_view.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: h2.copyWith(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;
          return isLandscape ? _buildLandscapeLayout() : _buildPortraitLayout();
        },
      ),
    );
  }

  /// Portrait Mode Layout (Scrollable)
  Widget _buildPortraitLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40), // Prevents overflow
        child: Column(
          children: [
            _settingsList(),
            _logoutButton(),
          ],
        ),
      ),
    );
  }

  /// Landscape Mode Layout (Scrollable & Adjusted)
  Widget _buildLandscapeLayout() {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(flex: 2, child: _settingsList()),
          Expanded(flex: 1, child: _logoutButton()),
        ],
      ),
    );
  }

  /// List of Settings Options
  Widget _settingsList() {
    return Column(
      children: [
        _settingsItem('Manage Subscription',
            'assets/images/settings/subscription_icon.svg', SubscriptionView()),
        _settingsItem(
            'Terms & Condition',
            'assets/images/settings/terms_icon.svg',
            TermsPrivacyView(isTerms: true)),
        _settingsItem(
            'Privacy Policy',
            'assets/images/settings/privacy_icon.svg',
            TermsPrivacyView(isTerms: false)),
        const SizedBox(height: 20),
        _helpSection(),
      ],
    );
  }

  /// Single List Item Widget
  Widget _settingsItem(String title, String iconPath, Widget route) {
    return ListTile(
      leading: SvgPicture.asset(iconPath),
      title:
          Text(title, style: h2.copyWith(color: AppColors.blue3, fontSize: 16)),
      onTap: () => Get.to(route),
    );
  }

  /// Help Section
  Widget _helpSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Help',
              style: h2.copyWith(color: Colors.white, fontSize: 16)),
        ),
        ListTile(
          leading: const Icon(Icons.email_outlined, color: Colors.blue),
          title: Text('Email Support',
              style: h2.copyWith(color: AppColors.blue3, fontSize: 16)),
          onTap: () => Get.to(HelpSupportView()),
        ),
      ],
    );
  }

  /// Logout Button
  Widget _logoutButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.redAccent),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: _showLogoutDialog,
        icon: const Icon(Icons.logout, color: Colors.redAccent),
        label: Text('Log Out',
            style: h2.copyWith(color: Colors.redAccent, fontSize: 16)),
      ),
    );
  }

  /// Logout Confirmation Dialog
  void _showLogoutDialog() {
    Get.defaultDialog(
      title: "Logout",
      titleStyle: h1.copyWith(color: Colors.white, fontSize: 18),
      middleText: "Are you sure you want to log out?",
      middleTextStyle: h2.copyWith(color: Colors.white70),
      backgroundColor: Colors.black,
      radius: 8,
      textConfirm: " Yes ",
      textCancel: " No ",
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.redAccent,
      buttonColor: Colors.redAccent,
      onConfirm: () {
        Get.back(); // Close dialog
        // Perform logout action here
      },
    );
  }
}
