import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/core/util/appImages.dart';

class HeaderSectionInHomePage extends StatelessWidget {
  const HeaderSectionInHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello \"name\"!",
              style: AppStyles.urbanistReqular18(context),
            ),
            Text(
              "Ready To Rescue?",
              style: AppStyles.urbanistMedium22(context)
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
            )
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorsApp.backGroundColor),
                child: FittedBox(
                    fit: BoxFit.none,
                    child: SvgPicture.asset(
                      Assets.imagesAIIcon,
                    )),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed("/notifactionpage");
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorsApp.backGroundColor),
                child: FittedBox(
                    fit: BoxFit.none,
                    child: SvgPicture.asset(
                      Assets.imagesNotificationIcon,
                    )),
              ),
            ),
          ],
        )
      ],
    );
  }
}
