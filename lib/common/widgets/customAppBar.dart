import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../customFont.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title, // Directly use title
        style: h2.copyWith(
            color: Colors.white), // Assuming h4 is a predefined text style
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Get.back(); // Navigate back using GetX
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
