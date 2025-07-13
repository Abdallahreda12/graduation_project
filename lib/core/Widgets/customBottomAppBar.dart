import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/loginController.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({super.key, required this.currentPageIndex});
  final int currentPageIndex;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  final controller = Get.find<LoginControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.primaryColorOpicaty,
      height: 60,
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        spacing: 40,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      if (widget.currentPageIndex != 0) {
                        
                        Get.toNamed("/homepage");
                      }
                    },
                    icon: SvgPicture.asset(
                      Assets.imagesHomeAppBarIcon,
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                          widget.currentPageIndex == 0
                              ? ColorsApp.primaryColor
                              : Colors.black,
                          BlendMode.srcIn),
                    )),
                IconButton(
                  onPressed: () {
                    if (widget.currentPageIndex != 1) {
                      Get.toNamed("/adoptionandhelp");
                    }
                  },
                  icon: SvgPicture.asset(
                    Assets.imagesPetsAppBarIcon,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        widget.currentPageIndex == 1
                            ? ColorsApp.primaryColor
                            : Colors.black,
                        BlendMode.srcIn),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (widget.currentPageIndex != 2) {
                      Get.toNamed("/mainbookpage");
                    }
                  },
                  icon: SvgPicture.asset(
                    Assets.imagesFluentDoctorAppBarIcon,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        widget.currentPageIndex == 2
                            ? ColorsApp.primaryColor
                            : Colors.black,
                        BlendMode.srcIn),
                  ),
                ),
                // IconButton(
                //     onPressed: () {},
                //     icon: SvgPicture.asset(
                //       Assets.imagesInstitutionLogo,
                //       width: 24,
                //       height: 24,
                //       colorFilter: ColorFilter.mode(
                //           widget.currentPageIndex == 1
                //               ? ColorsApp.primaryColor
                //               : Colors.black,
                //           BlendMode.srcIn),
                //     )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.imagesAIIcon,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        widget.currentPageIndex == 3
                            ? ColorsApp.primaryColor
                            : Colors.black,
                        BlendMode.srcIn),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.imagesChatIcon,
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                        widget.currentPageIndex == 4
                            ? ColorsApp.primaryColor
                            : Colors.black,
                        BlendMode.srcIn),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (widget.currentPageIndex != 5) {
                      Get.toNamed("/profilePage");
                    }
                  },
                  icon: SvgPicture.asset(
                    Assets.imagesPersonAppBarIcon,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        widget.currentPageIndex == 5
                            ? ColorsApp.primaryColor
                            : Colors.black,
                        BlendMode.srcIn),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
