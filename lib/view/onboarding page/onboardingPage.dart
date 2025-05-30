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
        children: [
          //
          //Header of the page
          //
          HeaderOnboardingpage(),
          //
          //body
          //
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            bottom: 105,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 400,
                      child: Pageviewcontent(
                        pageController: pageController,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DotsIndicator(
                      numOfDots: 3,
                      currentCardIndex: currentCardIndex,
                      colorOfDots: ColorsApp.primaryColor,
                    ),
                  ],
                ),
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
                text: 'get Started',
                width: MediaQuery.sizeOf(context).width,
                onTap: () {
                  Get.toNamed("/signinpage");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
