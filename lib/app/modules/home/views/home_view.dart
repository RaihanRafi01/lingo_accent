import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../common/appColors.dart';
import '../../../../common/customFont.dart';
import '../../../../common/widgets/auth/custom_button.dart';
import '../../../../common/widgets/home/progressIndicatorWithText.dart';
import '../../profile/views/profile_view.dart';
import '../../quiz/views/quiz_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121829),
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap Column with SingleChildScrollView
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: _buildHeader(),
                ),
                _buildMotivationalCard(),
                const SizedBox(height: 20),
                _buildProgressIndicators(),
                const SizedBox(height: 20),
                _buildProgressBar(),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.5, // Restrict ListView height
                  child: _buildLessonList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Flexible(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(ProfileView());
          },
          child: CircularPercentIndicator(
            backgroundColor: Colors.transparent,
            radius: 40.0,
            lineWidth: 5.0,
            percent: 0.3,
            center: Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage('assets/images/home/avatar.png'),
              ),
            ),
            progressColor: Colors.blue,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hello, Sourasith',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'You have Completed level 1',
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
        SizedBox(width: 10),
        Flexible(
          child: GestureDetector(
            onTap: () {
              print('power');
            },
            child: Image.asset(
              'assets/images/home/power_icon.png',
              scale: 4,
            ),
          ),
        ),
        SizedBox(width: 5),
        Flexible(
          child: GestureDetector(
            onTap: () {
              print('notification');
            },
            child: Image.asset(
              'assets/images/home/notification_icon.png',
              scale: 4,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildMotivationalCard() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: AppColors.homeCard,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: AppColors.cardBorder, // Set your desired border color here
        width: 2, // Set your desired border width
      ),
    ),
    child: Row(
      children: [
        Expanded(child: SvgPicture.asset('assets/images/home/card_home_1.svg')),
        SizedBox(width: 30),
        Expanded(
          child: Text(
            'Carry on your lessons with eagerness.',
            style: h2.copyWith(fontSize: 19),
          ),
        ),
      ],
    ),
  );
}

Widget _buildProgressIndicators() {
  return Column(
    children: [
      Row(
        children: [
          ProgressIndicatorWithText(
            percent: 0.3,
            svgPath: 'assets/images/home/speak_icon.svg',
            text: 'Pronunciation Accuracy ( 30%) Its Not Bad',
          ),
          ProgressIndicatorWithText(
            percent: 0.5,
            svgPath: 'assets/images/home/voca_icon.svg',
            text: 'vocabulary Accuracy ( 30%) Its Not Bad',
          ),
        ],
      ),
      Row(
        children: [
          ProgressIndicatorWithText(
            percent: 0.7,
            svgPath: 'assets/images/home/pronoun_icon.svg',
            text: 'Pronunciation Accuracy ( 30%) Its Not Bad',
          ),
          ProgressIndicatorWithText(
            percent: 1.0,
            svgPath: 'assets/images/home/quiz_icon.svg',
            text: 'You completed 7 quizzes Its Not Bad',
          ),
        ],
      ),
    ],
  );
}

Widget _buildProgressBar() {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: AppColors.homeCard2,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: AppColors.homeCard2[1], // Set your desired border color here
        width: 2, // Set your desired border width
      ),
    ),
    child: Row(
      children: [
        Image.asset(
          'assets/images/home/gold_star.png',
          scale: 4,
        ),
        SizedBox(width: 5),
        Expanded(
            child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              'If You Finish One More Class, You Will Win The First Batch.',
              style: h3.copyWith(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
            // Curved progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              // Set the radius to make it curved
              child: LinearProgressIndicator(
                value: 0.7,
                // Set the progress value (from 0.0 to 1.0)
                backgroundColor: Colors.grey[300],
                // Set background color of the progress bar
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blue), // Set the progress color
              ),
            ),
          ],
        )),
      ],
    ),
  );
}

Widget _buildLessonList() {
  return ListView.builder(
    itemCount: 4,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: AppColors.homeCard3,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.homeCard3[0],
              // Set your desired border color here
              width: 2, // Set your desired border width
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Lesson 02',
                          style: h1.copyWith(
                            fontSize: 20,
                          )),
                      SizedBox(width: 10),
                      SvgPicture.asset(
                        'assets/images/home/speak_icon.svg',
                        width: 20,
                        height: 20,
                      )
                    ],
                  ),
                  Text('Pronunciation practice',
                      style: h2.copyWith(
                        fontSize: 17,
                      )),
                  Text('Class Time: 25 Min',
                      style: h4.copyWith(
                        fontSize: 16,
                      )),
                ],
              ),
              CustomButton(
                  width: 120,
                  text: 'Start Class',
                  onPressed: () {
                    Get.to(QuizView());
                  })
            ],
          ),
        ),
      );
    },
  );
}
