import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/controller/ViewMyRequestsController.dart';
import 'package:graduation_project/core/Widgets/customImageSlider.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/data/models/adoptionModel.dart';
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
  @override
  Widget build(BuildContext context) {
    final UnifiedItem item = Get.arguments;
    final AdoptionModel adoptionRequest = item.data as AdoptionModel;
    final List<String> imagePaths = [
      '$linkServerImage${adoptionRequest.photoUrl}'
    ];

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
                        adoptionRequest.title,
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
                        gender: adoptionRequest.gender,
                        type: adoptionRequest.type,
                        size: adoptionRequest.size,
                        age: adoptionRequest.age.toString(),
                        location: adoptionRequest.location,
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
                      AboutPetInAdoptionDetailsPage(
                          aboutPet: adoptionRequest.description),
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
                  backgroundColor: ColorsApp.primaryColor,
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
