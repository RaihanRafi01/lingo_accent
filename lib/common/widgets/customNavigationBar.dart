import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../app/modules/dashboard/controllers/dashboard_controller.dart';
import '../appColors.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  final DashboardController controller = Get.find<DashboardController>();
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<Map<String, String>> navItems = [
    {
      "icon": "assets/images/nav/home.svg",
      "selected": "assets/images/nav/home_selected.svg"
    },
    {
      "icon": "assets/images/nav/analytic.svg",
      "selected": "assets/images/nav/analytic_selected.svg"
    },
    {
      "icon": "assets/images/nav/audio.svg",
      "selected": "assets/images/nav/audio_selected.svg"
    },
    {
      "icon": "assets/images/nav/community.svg",
      "selected": "assets/images/nav/community_selected.svg"
    },
    {
      "icon": "assets/images/nav/setting.svg",
      "selected": "assets/images/nav/setting_selected.svg"
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _animation =
        Tween<double>(begin: 1.0, end: 1.2).animate(_animationController);
  }

  void onItemTapped(int index) {
    controller.updateIndex(index); // Update GetX Controller state
    _animationController.forward().then((_) => _animationController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: AppColors.navColorBorder, // Background gradient
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2), // Controls border thickness
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: AppColors.navColor, // Inner background
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  // 🔥 Glow effect at the top of the navigation bar
                  Positioned(
                      top: -95, // Move the glow effect upwards
                      child: Image.asset(
                        'assets/images/nav/glow.png',
                        scale: 4,
                      )),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(navItems.length, (index) {
                      bool isSelected = index == controller.currentIndex.value;
                      return GestureDetector(
                        onTap: () => onItemTapped(index),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (isSelected)
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                transform: Matrix4.translationValues(
                                    0, -26, 0), // Moves icon up
                                child: SvgPicture.asset(
                                  navItems[index]["selected"]!,
                                  height: 65,
                                ),
                              ),
                            if (!isSelected)
                              SvgPicture.asset(
                                navItems[index]["icon"]!,
                                height: 26,
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
