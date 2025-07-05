import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/buttonsRow.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';
import 'package:graduation_project/view/verify%20page/widget/otpFieldWidget.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),

              // Count Steps
              StepsRow(
                currentIndex: 2,
              ),
              const SizedBox(height: 25),

              Text(
                'Verification',
                style: AppStyles.urbanistMedium22(context),
              ),
              const SizedBox(height: 7),
              Text(
                "We've sent the code to you",
                style: AppStyles.urbanistReqular14(context),
              ),
              const SizedBox(height: 45),

              // OTP Input Fields
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OtpField(first: true, last: false),
                        OtpField(first: false, last: false),
                        OtpField(first: false, last: false),
                        OtpField(first: false, last: true),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "didn't receive the code?",
                    style: AppStyles.urbanistReqular14(context),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "resend code",
                      style: AppStyles.urbanistMedium14(context)
                          .copyWith(color: ColorsApp.primaryColor),
                    ),
                  )
                ],
              ),
              const Spacer(),
              ButtonsRow(
                firstButton: "Back",
                secondButtonAction: () {
                  Get.toNamed('/signup2page');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
