import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/appColors.dart';

class BlurredBackground extends StatelessWidget {
  final Widget child;

  const BlurredBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*Positioned(
          bottom: 0,
          left: -50,
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFF3DB2FF),
                  Color(0xFF3DB2FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
        ),*/
        // Background SVG design
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/auth/back_ball.png',
            scale: 3,
          ),
        ),
        // Blurred container with gradient
        Positioned(
          bottom: 70,
          left: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.g1, // Start color
                    AppColors.g2, // End color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20), // Rounded corners
                border: Border.all(
                  color: const Color(0xFF607070), // Border color
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: child, // Custom child content passed to the widget
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
