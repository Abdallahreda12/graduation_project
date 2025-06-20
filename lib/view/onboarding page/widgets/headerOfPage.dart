import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';

class HeaderOnboardingpage extends StatelessWidget {
  const HeaderOnboardingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    final double circleHeight = screenHeight * 0.6;
    final double circleOffsetTop = -circleHeight * 0.5;
    final double circleOffsetSide = -screenWidth * 0.15;

    return Positioned(
      top: circleOffsetTop,
      left: circleOffsetSide,
      right: circleOffsetSide,
      child: ClipOval(
        child: Container(
          width: screenWidth * 1.3,
          height: circleHeight,
          color: ColorsApp.primaryColor,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.06),
              child: SvgPicture.asset(
                Assets.imagesLogoInverse,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
