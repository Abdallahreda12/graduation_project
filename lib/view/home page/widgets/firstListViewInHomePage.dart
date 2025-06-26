import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class FirstListViewInHomePage extends StatefulWidget {
  const FirstListViewInHomePage({super.key});

  @override
  State<FirstListViewInHomePage> createState() =>
      _FirstListViewInHomePageState();
}

class _FirstListViewInHomePageState extends State<FirstListViewInHomePage> {
  final controller = Get.find<HomePageControllerImp>();

  //for get header
  @override
  void initState() {
    controller.getHeaderInTipsAndTricks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Tips & Tricks",
          style: AppStyles.urbanistMedium16(context),
        ),
        const SizedBox(height: 10),
        SizedBox(
            height: 170,
            child: ListView.builder(
              itemCount: controller.tipsAndTricksList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.goTospecificTopiInTipsAndTricks(index);
                  },
                  child: Container(
                    width: 160,
                    height: 160,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: ColorsApp.primaryColorOpicaty,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              controller.tipsAndTricksPhotos[index],
                              width: 140,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              controller.headers[index],
                              style: AppStyles.urbanistMedium14(context),
                              maxLines: 3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}
