import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/Widgets/customImageSlider.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/adoption%20Details%20Page/widgets/aboutPetInAdoptionDetailsPage.dart';
import 'package:graduation_project/view/adoption%20Details%20Page/widgets/personalCard.dart';
import 'package:graduation_project/view/adoption%20Details%20Page/widgets/requestInformationInAdoptionDetailsPage.dart';

class AdoptionDetailsPage extends StatefulWidget {
  const AdoptionDetailsPage({super.key, this.enableDeleteButton = false});
  final bool enableDeleteButton;
  @override
  State<AdoptionDetailsPage> createState() => _AdoptionDetailsPageState();
}

class _AdoptionDetailsPageState extends State<AdoptionDetailsPage> {
  final List<String> imagePaths = [
    Assets.imagesAnimalPhoto1,
    Assets.imagesAnimalPhoto2,
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
                texts: ["Adoption", " Details"],
                colorsOfTexts: [ColorsApp.primaryColor, Colors.black],
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
                        colorsOfDots: ColorsApp.primaryColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //
                      //title text Section
                      //
                      Text(
                        "I have a pet and I want to offer him for adoption",
                        style: AppStyles.urbanistSemiBold16(context),
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //
                      //request information Sction
                      //
                      RequestInformationInAdoptionDetailsPage(
                        gender: 'Male',
                        type: 'Dog',
                        size: 'Medium',
                        age: '2',
                        location: 'https://maps.app.goo.gl/1ddFxqPYZboorctQ7',
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
                      AboutPetInAdoptionDetailsPage(
                          aboutPet:
                              'Figma ipsum component variant main layer. Style boolean italic star pixel mask underline. Union object main slice team align. Ellipse blur pixel fill rotate text. Duplicate inspect figma scale content move edit distribute asset. Inspect union create opacity strikethrough. Rectangle layout ipsum selection line connection export italic ipsum. Asset polygon rectangle component vertical invite pen ipsum. Duplicate hand comment editor star community strikethrough rotate share polygon. Content asset duplicate team strikethrough link fill.'),
                      SizedBox(
                        height: 10,
                      ),
                      widget.enableDeleteButton
                          ? GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: ColorsApp.primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Delete",
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            AppStyles.urbanistReqular16(context)
                                                .copyWith(color: Colors.white)),
                                  ],
                                ),
                              ),
                            )
                          : Text(""),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
