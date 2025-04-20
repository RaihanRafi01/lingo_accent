import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart'; // Import GetX

import '../../appColors.dart';
import '../../customFont.dart';

class CustomTextField2 extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? startIconPath; // Optional start icon
  final String? endIconPath; // Optional end icon
  final bool isPassword;
  final int maxLine;
  final TextEditingController? controller;
  final VoidCallback? onSuffixTap; // New function parameter for suffixIcon

  // Constructor
  const CustomTextField2({
    super.key,
    required this.labelText,
    required this.hintText,
    this.startIconPath,
    this.endIconPath,
    this.controller,
    this.isPassword = false,
    this.maxLine = 1,
    this.onSuffixTap, // Accept function parameter
  });

  @override
  Widget build(BuildContext context) {
    // Reactive variable to manage password visibility
    final RxBool obscureText = isPassword.obs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: h4.copyWith(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.fieldStart, AppColors.fieldEnd],
              // Fixed gradient
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.fieldStart, // Placeholder color (not visible)
              width: 1, // Border width
            ),
          ),
          child: Obx(() {
            // Use Obx to observe changes in obscureText and update TextField
            return TextField(
              controller: controller,
              maxLines: maxLine,
              cursorColor: AppColors.blurtext,
              obscureText: obscureText.value,
              // Bind to the reactive variable
              style: h4.copyWith(color: Colors.white),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                prefixIcon: startIconPath != null
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          startIconPath!,
                        ),
                      )
                    : null,
                suffixIcon: isPassword
                    ? GestureDetector(
                        onTap: () {
                          obscureText.value =
                              !obscureText.value; // Toggle visibility
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            obscureText.value
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            color: AppColors
                                .blurtext, // Adjust icon color as needed
                          ),
                        ),
                      )
                    : endIconPath != null
                        ? Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GestureDetector(
                              onTap: onSuffixTap, // Call external function
                              child: SvgPicture.asset(
                                endIconPath!,
                              ),
                            ),
                          )
                        : null,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: h4.copyWith(color: AppColors.blurtext),
              ),
            );
          }),
        ),
      ],
    );
  }
}
