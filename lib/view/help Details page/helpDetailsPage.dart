import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/controller/ViewMyRequestsController.dart';
import 'package:graduation_project/core/Widgets/customImageSlider.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/data/models/helpModel.dart';
import 'package:graduation_project/view/adoption%20Details%20Page/widgets/personalCard.dart';
import 'package:graduation_project/view/help%20Details%20page/widgets/aboutPetInAdoptionDetailsPage.dart';
import 'package:graduation_project/view/help%20Details%20page/widgets/requestInformationInAdoptionDetailsPage.dart';

class HelpDetailsPage extends StatefulWidget {
  const HelpDetailsPage({super.key, this.enableDeleteButton = false});
  final bool enableDeleteButton;
  @override
  State<HelpDetailsPage> createState() => _HelpDetailsPageState();
}

class _HelpDetailsPageState extends State<HelpDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final UnifiedItem item = Get.arguments;
    final HelpRequestModel helpRequest = item.data as HelpRequestModel;
    final List<String> imagePaths = ['$linkServerImage${helpRequest.photoUrl}'];

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
                texts: ["help", " details"],
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
                        helpRequest.title,
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
                        location: helpRequest.location,
                        dateAndTime: helpRequest.date,
                        socialMediaLink: helpRequest.socialMediaLink,
                      ),
                      widget.enableDeleteButton
                          ? SizedBox(
                              height: 0,
                            )
                          : SizedBox(
                              height: 10,
                            ),
                      //
                      //Personal Card Section
                      //
                      widget.enableDeleteButton
                          ? Text("")
                          : PersonalCard(
                              image: Assets.imagesProfilePhoto,
                              name: "James Parlor",
                              des: "Pet Owner"),
                      widget.enableDeleteButton
                          ? SizedBox(
                              height: 0,
                            )
                          : SizedBox(
                              height: 10,
                            ),
                      //
                      //about Pet Section
                      //
                      AboutPetInHelpDetailsPage(
                          aboutPet: helpRequest.description),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: widget.enableDeleteButton
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Handle deletion
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.secondaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Delete",
                  style: AppStyles.urbanistReqular16(context)
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          : null,
    );
  }
}
