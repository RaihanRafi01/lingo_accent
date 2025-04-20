import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../appColors.dart';

class CallFeedbackMessageWidget extends StatelessWidget {
  final String message;
  final bool isMike;
  final Map<String, Color> coloredWords; // Words that need to be colored

  const CallFeedbackMessageWidget({
    Key? key,
    required this.message,
    this.isMike = true,
    this.coloredWords = const {}, // Default: No colored words
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpans = message.split(' ').map((word) {
      return TextSpan(
        text: "$word ", // Keep spacing between words
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: coloredWords.containsKey(word)
              ? coloredWords[word]
              : Colors.white, // Default to white
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: AppColors.audioCard),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.cardBlurtext,
              width: 1,
            ),
          ),
          child: RichText(
            text: TextSpan(children: textSpans),
          ),
        ),
        const SizedBox(height: 10),
        if (isMike) SvgPicture.asset('assets/images/voice/voice_speaker.svg'),
        const SizedBox(height: 10),
      ],
    );
  }
}
