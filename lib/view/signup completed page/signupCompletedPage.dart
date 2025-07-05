import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/signUpController.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/onboarding%20page/widgets/headerOfPage.dart';

class SignupCompletedPage extends StatelessWidget {
  const SignupCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpControllerImp>();
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
            top: 350,
            left: 0,
            right: 0,
            bottom: 105,
            child: Column(
              children: [
                SvgPicture.asset(Assets.imagesSmileFace),
                Text(
                  "Profile Setup Complete!",
                  style: AppStyles.urbanistMedium22(context),
                ),
                Text(
                  "You're All Set, ${controller.userfirstName} ${controller.userlastName}!",
                  style: AppStyles.urbanistMedium16(context),
                )
              ],
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
