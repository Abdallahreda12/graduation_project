import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/Widgets/customImageSlider.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/adoption%20Details%20Page/widgets/personalCard.dart';
import 'package:graduation_project/view/help%20Details%20page/widgets/aboutPetInAdoptionDetailsPage.dart';
import 'package:graduation_project/view/help%20Details%20page/widgets/requestInformationInAdoptionDetailsPage.dart';

class HelpDetailsPage extends StatefulWidget {
  const HelpDetailsPage({super.key});

  @override
  State<HelpDetailsPage> createState() => _HelpDetailsPageState();
}

class _HelpDetailsPageState extends State<HelpDetailsPage> {
  final List<String> imagePaths = [
    Assets.imagesAnimalPhoto2,
    Assets.imagesAnimalPhoto1,
    Assets.imagesAnimalPhoto5,
  ];
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
          padding: const EdgeInsets.only(left: 27, right: 27, top: 35),
          child: Column(
            children: [
              //
              //header section
              //
              TextAndBackArrowHeader(
                texts: ["Help", " Details"],
                colorsOfTexts: [ColorsApp.secondaryColor, Colors.black],
              ),
              SizedBox(
                height: 25,
              ),
              //
              //content section
              //
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      //images slider section
                      //
                      CustomImagesSlider(
                        imagePaths: imagePaths,
                        colorsOfDots: ColorsApp.secondaryColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //
                      //title text Section
                      //
                      Text(
                        "Pet injured",
                        style: AppStyles.urbanistSemiBold16(context),
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //
                      //request information Sction
                      //
                      RequestInformationInHelpDetailsPage(
                        location: 'https://maps.app.goo.gl/1ddFxqPYZboorctQ7',
                        dateAndTime: 'Thu,1-2025',
                        socialMediaLink: 'https://www.facebook.com',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //
                      //Personal Card Section
                      //
                      PersonalCard(
                          image: Assets.imagesProfilePhoto,
                          name: "James Parlor",
                          des: "Pet Owner"),
                      SizedBox(
                        height: 10,
                      ),
                      //
                      //about Pet Section
                      //
                      AboutPetInHelpDetailsPage(
                          aboutPet:
                              'Figma ipsum component variant main layer. Style boolean italic star pixel mask underline. Union object main slice team align. Ellipse blur pixel fill rotate text. Duplicate inspect figma scale content move edit distribute asset. Inspect union create opacity strikethrough. Rectangle layout ipsum selection line connection export italic ipsum. Asset polygon rectangle component vertical invite pen ipsum. Duplicate hand comment editor star community strikethrough rotate share polygon. Content asset duplicate team strikethrough link fill.'),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
