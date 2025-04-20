import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/auth/custom_button.dart';
import '../../../../common/widgets/customAppBar.dart';
import '../../dashboard/views/dashboard_view.dart';

class LanguageSelectionView extends StatefulWidget {
  const LanguageSelectionView({super.key});

  @override
  _LanguageSelectionViewState createState() => _LanguageSelectionViewState();
}

class _LanguageSelectionViewState extends State<LanguageSelectionView> {
  final LanguageController2 controller = Get.put(LanguageController2());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Select Preferences'),
      body: GetBuilder<LanguageController2>(
        builder: (controller) {
          return Column(
            children: [
              const SizedBox(height: 20),

              // Show either Proficiency or Practice Time
              controller.showPracticeTime
                  ? _buildSectionTitle("Select Your Practice Time")
                  : _buildSectionTitle("Select Your Proficiency"),

              controller.showPracticeTime
                  ? _buildSelectionList(
                      controller.practiceTimes,
                      controller.selectedPracticeTimeIndex,
                      (index) => controller.updatePracticeTime(index),
                    )
                  : _buildSelectionList(
                      controller.proficiencyLevels,
                      controller.selectedProficiencyIndex,
                      (index) => controller.updateProficiency(index),
                    ),

              const SizedBox(height: 20),

              // Show Next or Get Started Button
              CustomButton(
                  width: 183,
                  text: controller.showPracticeTime ? "Get Started" : "Next",
                  onPressed: controller.isStepComplete()
                      ? () {
                          if (controller.showPracticeTime) {
                            controller.printSelectedOptions();
                            Get.offAll(DashboardView());
                          } else {
                            controller.toggleStep();
                          }
                        }
                      : () {}),
              /*ElevatedButton(
                onPressed: controller.isStepComplete()
                    ? () {
                  if (controller.showPracticeTime) {
                    controller.printSelectedOptions();
                  } else {
                    controller.toggleStep();
                  }
                }
                    : null, // Disable if selection is incomplete
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: controller.isStepComplete() ? Colors.blue : Colors.grey,
                ),
                child: Text(controller.showPracticeTime ? "Get Started" : "Next"),
              ),*/

              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSelectionList(
      List<String> items, int selectedIndex, Function(int) onTap) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade600, width: 1),
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [Color(0xff026DFF), Color(0xFF00D7FF)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
                color: isSelected ? null : Colors.transparent,
              ),
              child: Text(
                items[index],
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}

class LanguageController2 extends GetxController {
  int selectedProficiencyIndex = 0;
  int selectedPracticeTimeIndex = 0;
  bool showPracticeTime = false;

  final List<String> proficiencyLevels = [
    "Beginner",
    "Intermediate",
    "Advanced"
  ];
  final List<String> practiceTimes = [
    "15 Min Per Day",
    "30 Min Per Day",
    "1 Hour Per Day"
  ];

  void updateProficiency(int index) {
    selectedProficiencyIndex = index;
    update();
  }

  void updatePracticeTime(int index) {
    selectedPracticeTimeIndex = index;
    update();
  }

  bool isStepComplete() {
    return showPracticeTime
        ? selectedPracticeTimeIndex != -1
        : selectedProficiencyIndex != -1;
  }

  void toggleStep() {
    showPracticeTime = true;
    update();
  }

  void printSelectedOptions() {
    if (selectedProficiencyIndex != -1 && selectedPracticeTimeIndex != -1) {
      print(
          "Selected Proficiency: ${proficiencyLevels[selectedProficiencyIndex]}");
      print(
          "Selected Practice Time: ${practiceTimes[selectedPracticeTimeIndex]}");
    } else {
      Get.snackbar("Error", "Please complete your selection!");
    }
  }
}
