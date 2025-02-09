import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class HeaderOfAdotinAndHelpPage extends StatelessWidget {
  const HeaderOfAdotinAndHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "adoption",
              style: AppStyles.urbanistSemiBold18(context)
                  .copyWith(color: ColorsApp.primaryColor),
            ),
            Text(
              " & ",
              style: AppStyles.urbanistSemiBold18(context),
            ),
            Text(
              "help",
              style: AppStyles.urbanistSemiBold18(context)
                  .copyWith(color: ColorsApp.secondaryColor),
            ),
          ],
        ),
      ],
    );
  }
}
