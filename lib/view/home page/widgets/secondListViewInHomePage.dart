import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class SecondListViewInHomePage extends StatelessWidget {
  const SecondListViewInHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageControllerImp>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Need You",
              style: AppStyles.urbanistMedium16(context),
            ),
            GestureDetector(
              onTap: () {
                controller.goToAdoptAndHelp();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  "See all",
                  style: AppStyles.urbanistMedium12(context),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  //color will change depending on if help or adoption
                  border: index % 2 == 0
                      ? Border.all(color: ColorsApp.primaryColor)
                      : Border.all(
                          color: ColorsApp
                              .secondaryColor), //customize it when get API  " Border.all(color: ColorsApp.primaryColor)",
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          //take photo and put it here
                          Assets.imagesAnimalPhoto1,
                          fit: BoxFit.fill,
                          width: 130,
                          height: 100,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //take text and put it here
                      Text(
                        "Volunteers",
                        style: AppStyles.urbanistMedium16(context),
                      ),
                      Text(
                        "dog for adoption",
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: AppStyles.urbanistReqular14(context).copyWith(
                          color: Color(0xff3c3c3c),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
