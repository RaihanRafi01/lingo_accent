import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../common/appColors.dart';
import '../../../../common/customFont.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuizController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar and Text Box
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/voice/voice_avatar_1.png',
                        scale: 4),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient:
                                  LinearGradient(colors: AppColors.audioCard),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.cardBlurtext,
                                // Set your desired border color here
                                width: 1, // Set your desired border width
                              ),
                            ),
                            child: Text(
                                style: h2.copyWith(fontSize: 16),
                                'My Name is ujan'),
                          ),
                          const SizedBox(height: 10),
                          SvgPicture.asset(
                              'assets/images/voice/voice_speaker.svg'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Sentence Construction Area
                Obx(() {
                  const int totalBlanks = 4;
                  controller.totalBlanks.value = totalBlanks;
                  List<String> words = controller.sentenceWords;

                  return Column(
                    children: List.generate((totalBlanks + 3) ~/ 3, (rowIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            (rowIndex * 3 + 3 > totalBlanks)
                                ? totalBlanks % 3
                                : 3,
                            (index) {
                              int wordIndex = rowIndex * 3 + index;
                              return Text(
                                wordIndex < words.length
                                    ? words[wordIndex]
                                    : '______',
                                style: TextStyle(
                                  color: wordIndex < words.length
                                      ? Colors.white
                                      : AppColors.blurtext,
                                  fontSize: 18,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  );
                }),
                const SizedBox(height: 40),

                // Word Selection Buttons
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: controller.wordChoices.map((word) {
                    return _wordButton(controller, word);
                  }).toList(),
                ),
                const SizedBox(height: 40),

                // Microphone Button
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      if (controller.isListening.value) {
                        controller.stopListening();
                      } else {
                        controller.startListening();
                      }
                    },
                    child: Obx(() => Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: controller.isListening.value
                                ? AppColors.blue
                                : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                              'assets/images/voice/voice_mic.svg'),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _wordButton(QuizController controller, String word) {
    print(
        ':::::::::::::::::::::::::::::::::::::: check ${controller.wordUsed[word]}');
    return Obx(() => ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            backgroundColor:
                controller.wordUsed[word]! ? AppColors.blue2 : AppColors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: controller.wordUsed[word] == true
              ? null
              : () {
                  controller.addWordToSentence(word);
                  controller.wordUsed
                      .update(word, (value) => true); // Update state properly
                },
          child: Text(word,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
        ));
  }
}
