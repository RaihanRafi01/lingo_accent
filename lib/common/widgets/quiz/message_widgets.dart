import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../appColors.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final bool isBot; // Indicates if it's a bot message or user message

  const MessageWidget({
    Key? key,
    required this.message,
    this.isBot = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isBot)
          Image.asset('assets/images/voice/voice_avatar_1.png', scale: 4),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment:
                isBot ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Container(
                width: 200,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: AppColors.audioCard),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.cardBlurtext,
                    width: 1,
                  ),
                ),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              if (isBot)
                SvgPicture.asset('assets/images/voice/voice_speaker.svg'),
            ],
          ),
        ),
      ],
    );
  }
}
