import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/tips%20and%20tricks%20pages/TipsAndTricksPage/Data/TipsAndTricksForYourPetsPageData.dart';
class TipsAndTricksForYourPetsPage extends StatefulWidget {
  const TipsAndTricksForYourPetsPage({super.key});

  @override
  State<TipsAndTricksForYourPetsPage> createState() =>
      _TipsAndTricksForYourPetsPageState();
}

class _TipsAndTricksForYourPetsPageState
    extends State<TipsAndTricksForYourPetsPage> {
  int selectedIndex = 0;
  final PageController pageController = PageController();
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      body: Stack(children: [
        Positioned.fill(
          child: SvgPicture.asset(
            Assets.imagesLogoInverse,
            fit: BoxFit.none,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
          child: Column(
            children: [
              //
              //header of page
              //
              TextAndBackArrowHeader(
                  texts: ["Tips and tricks for your pets"],
                  colorsOfTexts: [Colors.black]),
              //
              //Categories
              //
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  itemCount: TipsAndTricksForYourPetsPageData.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        onItemTapped(index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        alignment: AlignmentDirectional.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            color: isSelected
                                ? ColorsApp.primaryColor.withAlpha(50)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: isSelected
                                    ? ColorsApp.primaryColor
                                    : ColorsApp.secondaryColor)),
                        child: Text(
                          TipsAndTricksForYourPetsPageData.categories[index],
                          style: AppStyles.urbanistMedium14(context),
                        ),
                      ),
                    );
                  },
                ),
              ),
              //
              //PageView
              //
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: TipsAndTricksForYourPetsPageData.pages,
                  onPageChanged: (index) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
