import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/colors.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow(
      {super.key,
      this.firstButton = 'Back',
      this.secondButton = 'Next',
      this.activeNextButton = true,
      required this.secondButtonAction,
      this.firstButtonColor = ColorsApp.backGroundColor});
  final String firstButton;
  final String secondButton;
  final bool activeNextButton;
  final VoidCallback secondButtonAction;
  final Color firstButtonColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custombutton(
          backGroundColor: firstButtonColor,
          textColor: ColorsApp.primaryColor,
          text: firstButton,
          width: (MediaQuery.sizeOf(context).width - 70) / 2,
          onTap: () {
            Get.back();
          },
        ),
        AbsorbPointer(
          absorbing: !activeNextButton,
          child: Custombutton(
            backGroundColor: activeNextButton
                ? ColorsApp.primaryColor
                : ColorsApp.primaryColor.withAlpha(120),
            text: secondButton,
            width: (MediaQuery.sizeOf(context).width - 70) / 2,
            onTap: secondButtonAction,
          ),
        )
      ],
    );
  }
}
