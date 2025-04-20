import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/quiz/message_widgets.dart';
import '../controllers/voice_controller.dart';

class VoiceView extends GetView<VoiceController> {
  const VoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MessageWidget(
                            message: 'My Name is ujan',
                            isBot: true,
                          ),
                          MessageWidget(
                            message: 'My Name is ujan',
                            isBot: false,
                          ),
                          MessageWidget(
                            message: 'My Name is ujan',
                            isBot: true,
                          ),
                          MessageWidget(
                            message: 'My ssssN',
                            isBot: true,
                          ),
                          MessageWidget(
                            message: 'My ssssN',
                            isBot: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Mic icon positioned above the scrolling content
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/voice/voice_mic.svg',
                  width: 150, // Adjust size as needed
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
