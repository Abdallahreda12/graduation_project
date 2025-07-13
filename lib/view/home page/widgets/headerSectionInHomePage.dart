import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/view/dashboard/AdminDashboard.dart';

class HeaderSectionInHomePage extends StatelessWidget {
  const HeaderSectionInHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageControllerImp>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello ${controller.firstName}!",
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
              onTap: () {
                controller.goToChatBoot();
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorsApp.primaryColorOpicaty),
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
                controller.goToNotifacation();
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorsApp.primaryColorOpicaty),
                child: FittedBox(
                    fit: BoxFit.none,
                    child: SvgPicture.asset(
                      Assets.imagesNotificationIcon,
                    )),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            controller.isAdmin
                ? GestureDetector(
                    onTap: () {
                      Get.to(AdminDashboard());
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ColorsApp.primaryColorOpicaty),
                      child: FittedBox(
                          fit: BoxFit.none,
                          child: SvgPicture.asset(
                            Assets.imagesAdminIcon,
                          )),
                    ),
                  )
                : Text('')
          ],
        )
      ],
    );
  }
}
