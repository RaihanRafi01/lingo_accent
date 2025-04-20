import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../appColors.dart';
import '../../customFont.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double textSize;
  final bool isGem;
  final VoidCallback onPressed;
  final List<Color> backgroundGradientColor;
  final List<Color> borderGradientColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsets padding;
  final bool isEditPage;
  final double width;
  final double height;
  final String svgAsset;

  const CustomButton({
    super.key,
    this.textSize = 16,
    required this.text,
    required this.onPressed,
    this.isGem = false,
    this.backgroundGradientColor = AppColors.btnColor,
    this.borderGradientColor = AppColors.btnColor,
    this.textColor = Colors.white,
    this.borderRadius = 20.0,
    this.padding = const EdgeInsets.symmetric(vertical: 5),
    this.isEditPage = false,
    this.width = double.maxFinite,
    this.height = 50,
    this.svgAsset = 'assets/images/home/class_icon.svg',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: backgroundGradientColor,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            // Add this to ensure inner content is clipped
            borderRadius: BorderRadius.circular(borderRadius),
            child: Column(
              children: [
                // Top border
                Container(
                  height: 1,
                  color: borderGradientColor.isNotEmpty
                      ? AppColors.btntop
                      : Colors.transparent,
                ),
                // Main content
                Expanded(
                  child: Container(
                    padding: padding,
                    alignment: Alignment.center,
                    child: textWithIcon(),
                  ),
                ),
                // Bottom border
                Container(
                  height: 2,
                  color: borderGradientColor.isNotEmpty
                      ? borderGradientColor.length > 1
                          ? AppColors.btnbottom
                          : AppColors.btntop
                      : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textWithIcon() {
    return Row(
      children: [
        if (isGem && svgAsset.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SvgPicture.asset(
              svgAsset,
              width: 15.0,
              height: 15.0,
              color: Colors.white,
            ),
          ),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: h4.copyWith(
              fontSize: textSize,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
