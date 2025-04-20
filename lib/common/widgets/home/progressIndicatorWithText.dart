import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter/material.dart';

import '../../customFont.dart';

class ProgressIndicatorWithText extends StatelessWidget {
  final double percent;
  final String svgPath;
  final String text;

  ProgressIndicatorWithText({
    required this.percent,
    required this.svgPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: CircularPercentIndicator(
              backgroundColor: Colors.transparent,
              radius: 24.0,
              lineWidth: 3.0,
              percent: percent,
              center: Padding(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(
                  svgPath,
                  width: 40,
                  height: 40,
                ),
              ),
              progressColor: Colors.blue,
            ),
          ),
          Expanded(
              child: Text(
            text,
            style: h3.copyWith(fontSize: 12),
          )),
        ],
      ),
    );
  }
}
