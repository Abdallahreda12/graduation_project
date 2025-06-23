import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/Widgets/dotsIndicator.dart';
import 'package:graduation_project/view/onboarding%20page/widgets/headerOfPage.dart';
import 'package:graduation_project/view/onboarding%20page/widgets/pageViewContent.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController pageController;
  int currentCardIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentCardIndex = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          //
          // Header
          //
          HeaderOnboardingpage(),
          //
          // PageView & dots
          //
          Positioned(
            top: screenHeight * 0.33,
            left: 0,
            right: 0,
            bottom: screenHeight * 0.14,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.4,
                    child: Pageviewcontent(pageController: pageController),
                  ),
                  const SizedBox(height: 20),
                  DotsIndicator(
                    numOfDots: 3,
                    currentCardIndex: currentCardIndex,
                    colorOfDots: ColorsApp.primaryColor,
                  ),
                ],
              ),
            ),
          ),
          //
          // Button
          //
          Positioned(
            bottom: screenHeight * 0.04,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Custombutton(
                text: 'Get Started',
                width: screenWidth,
                onTap: () {
                  Get.toNamed("/signinpage");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
