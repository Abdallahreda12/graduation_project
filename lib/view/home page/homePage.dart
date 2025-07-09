import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/core/Widgets/CustomBottomAppBar.dart';
import 'package:graduation_project/core/Widgets/customPlusBottunInAppBar.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/view/home%20page/widgets/NavigatorsTapInHomePage.dart';
import 'package:graduation_project/view/home%20page/widgets/firstListViewInHomePage.dart';
import 'package:graduation_project/view/home%20page/widgets/headerSectionInHomePage.dart';
import 'package:graduation_project/view/home%20page/widgets/secondListViewInHomePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return Scaffold(
        backgroundColor: ColorsApp.backGroundColor,
        //plusIcon in the bottmAppBar
        floatingActionButton: CustomPlusBottunInAppBar(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        //CustomBottomAppBar
        bottomNavigationBar: CustomBottomAppBar(
          currentPageIndex: 0,
        ),
        body: GetBuilder<HomePageControllerImp>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.only(
              top: 35,
              left: 25,
            ),
            child: Stack(children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  Assets.imagesLogoInverse,
                  fit: BoxFit.none,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  //
                  // Header Section
                  //
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: HeaderSectionInHomePage(),
                  ),
                  const SizedBox(height: 15),
                  //
                  // Navigator Tabs
                  //
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: NavigatorsTapsInHomePage(),
                          ),
                          const SizedBox(height: 10),
                          //
                          //First ListView
                          //
                          FirstListViewInHomePage(),
                          SizedBox(
                            height: 20,
                          ),
                          //
                          //Second ListView
                          //
                          SecondListViewInHomePage(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
