import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/Widgets/customBottomAppBar.dart';
import 'package:graduation_project/core/Widgets/customPlusBottunInAppBar.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/bookPages/mainBoohPage/widgets/BannerOfMainBookPage.dart';
import 'package:graduation_project/view/bookPages/mainBoohPage/widgets/DoctorCard.dart';
import 'package:graduation_project/view/bookPages/mainBoohPage/widgets/searchBarInMainBookPage.dart';

class MainBookPage extends StatelessWidget {
  const MainBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      //plusIcon in the bottmAppBar
      floatingActionButton: CustomPlusBottunInAppBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      //CustomBottomAppBar
      bottomNavigationBar: CustomBottomAppBar(
        currentPageIndex: 2,
      ),
      body: Stack(children: [
        Positioned.fill(
          child: SvgPicture.asset(
            Assets.imagesLogoInverse,
            fit: BoxFit.none,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              //
              //Banner of the page
              //
              BannerOfMainBookPage(),
              //
              //searchBar
              //
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SearchbarInMainBookPage()),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Veterinary",
                        style: AppStyles.urbanistSemiBold18(context),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //
              //doctor list
              //
              Wrap(
                spacing: 10,
                runSpacing: 12,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: DoctorCard()),
                  );
                }),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
