import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/colors.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow(
      {super.key, this.firstButton = 'Back', this.secondButton = 'Next'});
  final String firstButton;
  final String secondButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custombutton(
          backGroundColor: ColorsApp.backGroundColor,
          textColor: ColorsApp.primaryColor,
          text: firstButton,
          width: (MediaQuery.sizeOf(context).width - 70) / 2,
          onTap: () {
            Get.back();
          },
        ),
        Custombutton(
          text: secondButton,
          width: (MediaQuery.sizeOf(context).width - 70) / 2,
          onTap: () {
            Get.toNamed("/signup2page");
          },
        )
      ],
    );
  }
}
