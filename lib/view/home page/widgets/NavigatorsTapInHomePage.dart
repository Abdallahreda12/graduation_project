import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/core/util/appImages.dart';

class NavigatorsTapsInHomePage extends StatelessWidget {
  const NavigatorsTapsInHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed("/adoptionandhelp");
                },
                child: Container(
                  //28 -> 25 padding + 3 space between two item
                  width: (MediaQuery.of(context).size.width / 2) - 28,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(color: ColorsApp.backGroundColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: ColorsApp.primaryColor),
                        child: FittedBox(
                          fit: BoxFit.none,
                          child: SvgPicture.asset(
                            Assets.imagesPetsIcon,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Adopt  & Help",
                            style: AppStyles.urbanistMedium16(context),
                          ),
                          Text(
                            softWrap: true,
                            "Browse animals available for adoption.",
                            style: AppStyles.urbanistReqular14(context),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  //28 -> 25 padding + 3 space between two item
                  width: (MediaQuery.of(context).size.width / 2) - 28,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(color: ColorsApp.backGroundColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: ColorsApp.primaryColor),
                        child: FittedBox(
                          fit: BoxFit.none,
                          child: SvgPicture.asset(
                            Assets.imagesSolarHandHeartIcon,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Institutions",
                            style: AppStyles.urbanistMedium16(context),
                          ),
                          Center(
                            widthFactor: 1,
                            child: Text(
                              softWrap: true,
                              "Report a lost pet or a found animal.",
                              style: AppStyles.urbanistReqular14(context),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            //28 -> 25 padding + 3 space between two item
            width: MediaQuery.of(context).size.width - 50,
            padding: EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 10),
            decoration: BoxDecoration(color: ColorsApp.backGroundColor),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: ColorsApp.primaryColor),
                  child: FittedBox(
                    fit: BoxFit.none,
                    child: SvgPicture.asset(
                      Assets.imagesShoppingCartIcon,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Store",
                        style: AppStyles.urbanistMedium16(context),
                      ),
                      Center(
                        widthFactor: 1,
                        child: Text(
                          softWrap: true,
                          "We offer a variety of healthy pets with a guarantee of quality and guidance for optimal care.",
                          style: AppStyles.urbanistReqular14(context),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
