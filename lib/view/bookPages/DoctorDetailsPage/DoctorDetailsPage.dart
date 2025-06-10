import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/view/bookPages/DoctorDetailsPage/widgets/DoctorCardOnDoctorDetailsPage.dart';
import 'package:graduation_project/view/bookPages/DoctorDetailsPage/widgets/Section2InDoctorDetailsPage.dart';
import 'package:graduation_project/view/bookPages/DoctorDetailsPage/widgets/Section3InDoctorDetailsPage.dart';
import 'package:graduation_project/view/bookPages/DoctorDetailsPage/widgets/Section4InDoctorDetailsPage.dart';
import 'package:graduation_project/view/bookPages/DoctorDetailsPage/widgets/Section5InDoctorDetailsPage.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

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
                  texts: ["Doctor Details"], colorsOfTexts: [Colors.black]),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //
                      //Section 1 "Doctor Card" (need to make it customization)
                      //
                      DoctorCardOnDoctorDetailsPage(),
                      //
                      //Section 2
                      //
                      Section2InDoctorDetailsPage(),
                      //
                      //section 3 'About'
                      //
                      Section3InDoctorDetailsPage(),
                      //
                      //section 4 'Education'
                      //
                      Section4InDoctorDetailsPage(),
                      //
                      //setcion 5 "Location"
                      //
                      Section5InDoctorDetailsPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 33,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Custombutton(
              text: 'Book an appointment',
              width: MediaQuery.sizeOf(context).width,
              onTap: () {
                Get.toNamed("/bookpage");
              },
            ),
          ),
        ),
      ]),
    );
  }
}
