import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../common/customFont.dart';
import 'feedback_view.dart';

class CallView extends GetView {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth > constraints.maxHeight
                ? _buildLandscapeLayout()
                : _buildPortraitLayout();
          },
        ),
      ),
    );
  }

  /// Common Profile UI (Used in Both Portrait & Landscape)
  Widget _profileUI(double size, double fontSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Layla', style: h1.copyWith(fontSize: fontSize)),
        SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset('assets/images/voice/circle_svg.svg', width: size),
            Image.asset('assets/images/voice/call_person_1.png', scale: 4),
          ],
        ),
      ],
    );
  }

  /// Common Call Button UI
  Widget _callButton(double width) {
    return GestureDetector(
      onTap: () => Get.to(FeedbackView()),
      child:
          SvgPicture.asset('assets/images/voice/call_hang.svg', width: width),
    );
  }

  /// Portrait Mode Layout
  Widget _buildPortraitLayout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _profileUI(200, 30),
          Column(
            children: [
              _callButton(70),
              SizedBox(height: 10),
              Image.asset('assets/images/nav/glow.png', scale: 4),
            ],
          ),
        ],
      ),
    );
  }

  /// Landscape Mode Layout
  Widget _buildLandscapeLayout() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _profileUI(150, 26),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    _callButton(60),
                  ],
                ),
              ],
            ),
            Image.asset('assets/images/nav/glow.png', scale: 3),
          ],
        ),
      ),
    );
  }
}
