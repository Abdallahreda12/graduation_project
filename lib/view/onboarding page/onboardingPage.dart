import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/view/onboarding%20page/widgets/dotsIndicator.dart';
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
    pageController = PageController();

    pageController.addListener(
      () {
        currentCardIndex = pageController.page!.round();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          //
          //Header of the page
          //
          Headerofpage(),
          //
          //body
          //
          Transform.translate(
            offset: Offset(0, 300),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    child: Pageviewcontent(
                      pageController: pageController,
                    ),
                  ),
                  DotsIndicator(
                    currentCardIndex: currentCardIndex,
                  ),
                ],
              ),
            ),
          ),
          //
          //button
          //
          Positioned(
            bottom: 33,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Custombutton(
                text: 'Get Started',
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
          )
        ],
      ),
    );
  }
}
