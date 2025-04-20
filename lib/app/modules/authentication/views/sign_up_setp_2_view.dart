import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo_accent/app/modules/authentication/views/sign_up_step_3_view.dart';

import '../../../../common/widgets/auth/custom_button.dart';
import '../../../../common/widgets/customAppBar.dart';

class SignUpStep2View extends StatelessWidget {
  const SignUpStep2View({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController _controller = Get.put(LanguageController());

    return Scaffold(
      appBar: CustomAppBar(
          title: _controller.showNativeSelection
              ? 'Select Native Language'
              : 'Select Language'),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<LanguageController>(
              init: LanguageController(),
              builder: (controller) {
                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: controller.languages.length,
                  itemBuilder: (context, index) {
                    bool isSelected = controller.showNativeSelection
                        ? index == controller.selectedNativeIndex
                        : index == controller.selectedIndex;

                    return GestureDetector(
                      onTap: () {
                        controller.updateSelectedIndex(index);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: Colors.grey.shade600, width: 1),
                          gradient: isSelected
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xff026DFF),
                                    Color(0xFF00D7FF)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )
                              : null,
                          color: isSelected ? null : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              controller.languages[index]["flag"]!,
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                controller.languages[index]["name"]!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              controller.languages[index]["translation"]!,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          GetBuilder<LanguageController>(
            builder: (controller) {
              return controller.showNativeSelection
                  ? CustomButton(
                      width: 183,
                      text: 'NEXT',
                      onPressed: () {
                        controller.printSelectedLanguages();
                        Get.to(LanguageSelectionView());
                      })
                  : CustomButton(
                      width: 183,
                      text: 'NEXT',
                      onPressed: () {
                        controller.showNativeSelection = true;
                        controller.update();
                      });
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class LanguageController extends GetxController {
  int selectedIndex = 0; // Default selected index for normal language
  int selectedNativeIndex = 0; // Default selected index for native language
  bool showNativeSelection = false; // Controls screen step

  final List<Map<String, String>> languages = [
    {
      "name": "English",
      "translation": "(English)",
      "flag": "assets/images/flags/uk.png"
    },
    {
      "name": "Spanish",
      "translation": "(Español)",
      "flag": "assets/images/flags/uk.png"
    },
    {
      "name": "Chinese Mandarin",
      "translation": "(中文)",
      "flag": "assets/images/flags/uk.png"
    },
    {
      "name": "French",
      "translation": "(Français)",
      "flag": "assets/images/flags/uk.png"
    },
    {
      "name": "Arabic",
      "translation": "(العربية)",
      "flag": "assets/images/flags/uk.png"
    },
    {
      "name": "Egypt",
      "translation": "(Syria)",
      "flag": "assets/images/flags/uk.png"
    },
  ];

  void updateSelectedIndex(int index) {
    if (showNativeSelection) {
      selectedNativeIndex = index;
    } else {
      selectedIndex = index;
    }
    update();
  }

  void printSelectedLanguages() {
    if (selectedIndex == -1 || selectedNativeIndex == -1) {
      Get.snackbar("Error", "Please select both languages!");
      return;
    }
    print("Selected Language: ${languages[selectedIndex]["name"]}");
    print("Native Language: ${languages[selectedNativeIndex]["name"]}");
  }

  void goBackToNormalSelection() {
    showNativeSelection = false;
    update();
  }
}
