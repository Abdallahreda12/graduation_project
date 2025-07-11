import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/core/util/appImages.dart';

class NavigatorsTapsInHomePage extends StatelessWidget {
  const NavigatorsTapsInHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageControllerImp>();
    return Column(
      children: [
        IntrinsicHeight(
          //
          //first row in the navigatorPage
          //
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  controller.goToAdoptAndHelp();
                },
                child: Container(
                  //28 -> 25 padding + 3 space between two item
                  width: (MediaQuery.of(context).size.width / 2) - 28,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration:
                      BoxDecoration(color: ColorsApp.primaryColorOpicaty),
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
                onTap: () {
                  controller.goToChats();
                },
                child: Container(
                  //28 -> 25 padding + 3 space between two item
                  width: (MediaQuery.of(context).size.width / 2) - 28,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration:
                      BoxDecoration(color: ColorsApp.primaryColorOpicaty),
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
                            colorFilter:
                                ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            Assets.imagesChatIcon,
                            width: 24,
                            height: 24,
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
                            "Chats",
                            style: AppStyles.urbanistMedium16(context),
                          ),
                          Center(
                            widthFactor: 1,
                            child: Text(
                              softWrap: true,
                              "Direct chat between users and doctors for quick health advice.",
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
        //
        //Doctor Navigator
        //
        GestureDetector(
          onTap: () {
            try{
                 controller.goToDoctors();
            }catch(e){
              print(e) ;
            }
          
          },
          child: Container(
            //28 -> 25 padding + 3 space between two item
            width: MediaQuery.of(context).size.width - 50,
            padding: EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 10),
            decoration: BoxDecoration(color: ColorsApp.primaryColorOpicaty),
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
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      Assets.imagesFluentDoctorAppBarIcon,
                      width: 26,
                      height: 26,
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
                        "Doctors",
                        style: AppStyles.urbanistMedium16(context),
                      ),
                      Center(
                        widthFactor: 1,
                        child: Text(
                          softWrap: true,
                          "Find and chat with trusted doctors anytime.",
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
        SizedBox(
          height: 10,
        ),
        //
        //requests Navigator
        //
        GestureDetector(
          onTap: () {
            controller.goToAllRequests();
          },
          child: Container(
            //28 -> 25 padding + 3 space between two item
            width: MediaQuery.of(context).size.width - 50,
            padding: EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 10),
            decoration: BoxDecoration(color: ColorsApp.primaryColorOpicaty),
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
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      Assets.requestsIcon,
                      width: 24,
                      height: 24,
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
                        "Requests",
                        style: AppStyles.urbanistMedium16(context),
                      ),
                      Center(
                        widthFactor: 1,
                        child: Text(
                          softWrap: true,
                          "see all your requests",
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
