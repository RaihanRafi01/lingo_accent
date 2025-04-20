import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/customNavigationBar.dart';
import '../../analytic/views/analytic_view.dart';
import '../../community/views/community_view.dart';
import '../../home/views/home_view.dart';
import '../../settings/views/settings_view.dart';
import '../../voice/views/voice_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  final int index;

  const DashboardView({super.key, this.index = 0}); // Default index to 0

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late final DashboardController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(DashboardController());
    controller.currentIndex.value =
        widget.index; // Set the index on initialization
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeView(),
      AnalyticView(),
      VoiceView(),
      CommunityView(),
      SettingsView(),
    ];

    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar:
          const CustomNavigationBar(), // Using the custom navigation bar
    );
  }
}
