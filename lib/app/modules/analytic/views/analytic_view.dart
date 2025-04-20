import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../common/appColors.dart';
import '../../../../common/customFont.dart';
import '../../../../common/widgets/auth/custom_button.dart';
import '../../quiz/views/quiz_view.dart';
import '../controllers/analytic_controller.dart';

class AnalyticView extends GetView<AnalyticController> {
  const AnalyticView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AnalyticController());

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          // Ensures full-width on rotation
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight, // Ensures full height
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildTabButton("Rank", 0),
                          const SizedBox(width: 20),
                          _buildTabButton("Achievements", 1),
                        ],
                      ),
                      const SizedBox(height: 50),
                      GetBuilder<AnalyticController>(
                        builder: (controller) =>
                            controller.selectedTabIndex == 0
                                ? _buildRankingTab(context)
                                : _buildAchievementsTab(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTabButton(String text, int tabIndex) {
    return GetBuilder<AnalyticController>(
      builder: (controller) {
        final isActive = controller.selectedTabIndex == tabIndex;
        return GestureDetector(
          onTap: () => controller.changeTab(tabIndex),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(text,
                  style: h1.copyWith(
                      color: isActive ? AppColors.blue : Colors.white,
                      fontSize: 18)),
              if (isActive)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 2,
                        width: tabIndex == 0 ? 30 : 70,
                        color: AppColors.blue),
                    const SizedBox(height: 4),
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 2,
                        width: tabIndex == 0 ? 20 : 40,
                        color: AppColors.blue),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRankingTab(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: CustomButton(
              width: 130,
              height: 40,
              text: 'New Quiz',
              onPressed: () {
                Get.to(QuizView());
              }),
        ),
        const SizedBox(height: 20),
        _buildSectionTitle('Your Rank'),
        _buildRankCard(
            rank: 12,
            name: "Daniil Medvedev",
            country: "Russia",
            score: 7.80,
            isOwnRank: true),
        const SizedBox(height: 20),
        _buildSectionTitle('All Rank'),

        /// 👇 Ensures full screen scrolling
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: _buildRankCard(
                  rank: index + 1,
                  name: "Daniil Medvedev",
                  country: "Russia",
                  score: 8.00,
                  isOwnRank: false),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementsTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProgressBar(),
        const SizedBox(height: 16),
        _buildSectionTitle('Upcoming'),
        const SizedBox(height: 12),
        Column(
          children: upcomingList
              .map((card) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildUpcomingCard(card.svgAsset, card.text),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) =>
      Text(title, style: h1.copyWith(fontSize: 20));

  Widget _buildRankCard({
    required int rank,
    required String name,
    required String country,
    required double score,
    required bool isOwnRank,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            SizedBox(
              width: constraints.maxWidth, // Make SVG take full width
              child: SvgPicture.asset(
                isOwnRank
                    ? 'assets/images/analytic/own_card.svg'
                    : 'assets/images/analytic/other_card.svg',
                fit: BoxFit.fill, // Ensures the SVG scales properly
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/home/avatar.png'),
                      radius: 24),
                  //const SizedBox(width: 20),
                  Text('#$rank',
                      style: TextStyle(
                          color: isOwnRank ? Colors.white : AppColors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  //const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(name,
                          style: TextStyle(
                              color: isOwnRank ? Colors.white : AppColors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text(country,
                          style: TextStyle(
                              color: isOwnRank ? Colors.white : AppColors.blue,
                              fontSize: 14)),
                    ],
                  ),
                  Text(score.toString(),
                      style: TextStyle(
                          color: isOwnRank ? Colors.white : AppColors.blue,
                          fontSize: 16)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildUpcomingCard(String svgAsset, String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: AppColors.homeCard3,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.homeCard3[1], width: 2),
      ),
      child: Row(
        children: [
          Image.asset(svgAsset, scale: 4),
          const SizedBox(width: 5),
          Expanded(child: Text(text, style: h3.copyWith(fontSize: 15))),
        ],
      ),
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
        border: Border.all(color: AppColors.homeCard2[1], width: 2),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/home/gold_star.png', scale: 4),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              children: [
                Text(
                    'If You Finish One More Class, You Will Win The First Batch.',
                    textAlign: TextAlign.center,
                    style: h3.copyWith(fontSize: 15)),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UpcomingCardModel {
  final String svgAsset;
  final String text;

  UpcomingCardModel({required this.svgAsset, required this.text});
}

final List<UpcomingCardModel> upcomingList = [
  UpcomingCardModel(
      svgAsset: 'assets/images/home/gold_like.png',
      text: 'If you finish 10 class, you will win the 2nd batch.'),
  UpcomingCardModel(
      svgAsset: 'assets/images/home/gold_star.png',
      text: 'If you finish 10 class, you will win the 2nd batch.'),
  UpcomingCardModel(
      svgAsset: 'assets/images/home/gold_star.png',
      text: 'Win a special reward for finishing 3 more classes!'),
];
