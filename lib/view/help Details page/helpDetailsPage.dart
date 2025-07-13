import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/controller/ViewMyRequestsController.dart';
import 'package:graduation_project/core/Widgets/customImageSlider.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/class/handleWidgets.dart';
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
  final controller = Get.find<ViewMyRequestsControllerImp>();
  String? username;

  @override
  void initState() {
    super.initState();
    final UnifiedItem item = Get.arguments;
    final HelpRequestModel helpRequest = item.data as HelpRequestModel;
    loadUserName(helpRequest.userId);
  }

  void loadUserName(int userId) async {
    var name = await controller.getUserName(userId);
    setState(() {
      username = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UnifiedItem item = Get.arguments;
    final HelpRequestModel helpRequest = item.data as HelpRequestModel;
    final List<String> imagePaths = ['$linkServerImage${helpRequest.photoUrl}'];

    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      body: HandleLoadingIndicator(
        isLoading: controller.isLoading,
        widget: Stack(children: [
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
                TextAndBackArrowHeader(
                  onTap: () {
                    Get.toNamed("/homepage");
                  },
                  texts: ["help", " details"],
                  colorsOfTexts: [ColorsApp.secondaryColor, Colors.black],
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImagesSlider(
                          imagePaths: imagePaths,
                          colorsOfDots: ColorsApp.secondaryColor,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          helpRequest.title,
                          style: AppStyles.urbanistSemiBold16(context),
                          maxLines: 3,
                        ),
                        const SizedBox(height: 10),
                        RequestInformationInHelpDetailsPage(
                          location: helpRequest.location,
                          dateAndTime: helpRequest.date,
                          socialMediaLink: helpRequest.socialMediaLink,
                        ),
                        if (!widget.enableDeleteButton)
                          const SizedBox(height: 10),
                        if (!widget.enableDeleteButton)
                          PersonalCard(
                            image: Assets.imagesProfilePhoto,
                            name: username ?? "Loading...",
                            des: "Pet Owner",
                          ),
                        const SizedBox(height: 10),
                        AboutPetInHelpDetailsPage(
                          aboutPet: helpRequest.description,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: widget.enableDeleteButton
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () async {
                  await controller.deleteHelpRequest(
                      helpRequest.helpId, helpRequest.photoUrl);
                  await controller.getRequest();
                  Get.offNamed("/myrequestspage");
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
