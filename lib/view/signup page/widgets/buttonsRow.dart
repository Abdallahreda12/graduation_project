import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/colors.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custombutton(
          backGroundColor: ColorsApp.backGroundColor,
          textColor: ColorsApp.primaryColor,
          text: "Back to Sign in",
          width: (MediaQuery.sizeOf(context).width - 70) / 2,
          onTap: () {
            Get.back();
          },
        ),
        Custombutton(
          text: "Next",
          width: (MediaQuery.sizeOf(context).width - 70) / 2,
          onTap: () {
            Get.back();
          },
        )
      ],
    );
  }
}
