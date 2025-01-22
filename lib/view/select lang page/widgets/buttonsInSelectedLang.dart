import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';

class ButtonsInSelectedLang extends StatelessWidget {
  const ButtonsInSelectedLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Custombutton(
          borderradius: 8,
          text: "Arabic",
          width: MediaQuery.sizeOf(context).width,
          onTap: () {
            Get.toNamed("/onboarding");
          },
        ),
        SizedBox(
          height: 12,
        ),
        Custombutton(
          borderradius: 8,
          thereIsBorder: true,
          textColor: Colors.black,
          backGroundColor: Colors.transparent,
          text: "English",
          width: MediaQuery.sizeOf(context).width,
          onTap: () {
            Get.toNamed("/onboarding");
          },
        )
      ],
    );
  }
}
