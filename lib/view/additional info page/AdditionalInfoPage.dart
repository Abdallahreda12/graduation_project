import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/profileController.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/profile%20page/widgets/personCardInProfilePage.dart';

class AdditionalInfoPage extends StatefulWidget {
  const AdditionalInfoPage({super.key});

  @override
  State<AdditionalInfoPage> createState() => _AdditionalInfoPageState();
}

class _AdditionalInfoPageState extends State<AdditionalInfoPage> {
  final controller = Get.find<ProfileControllerImp>();

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextAndBackArrowHeader(
                        onTap: () {
                          Get.toNamed("/profilePage");
                        },
                        texts: ["Additional Info"],
                        colorsOfTexts: [Colors.black]),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/additionalinfoeditpage');
                    },
                    child: Icon(
                      Icons.edit_note_outlined,
                      size: 28,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              //
              //profile card
              //
              controller.user.type == 0
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            PersonCardInProfilePage(
                              name:
                                  '${controller.fullInfoForUser?.firstName} ${controller.fullInfoForUser?.lastName}',
                              image:
                                  '$linkServerImage${controller.user.usersPhotoUrl}',
                              gmail: controller.fullInfoForUser?.emailAddress,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AdditionalInfoCard(
                              question:
                                  "Age Range of animals that you preferred",
                              answer:
                                  controller.fullInfoForUser?.ageRangeOfAnimal,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            AdditionalInfoCard(
                              question: "Are you looking for adoption?",
                              answer: controller.fullInfoForUser
                                          ?.lookingForAdoption ==
                                      "1"
                                  ? "Yes"
                                  : "No",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            AdditionalInfoCard(
                              question: "Animals adoption preferred",
                              answer: controller
                                  .fullInfoForUser?.animalsAdoptionPreferred,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            AdditionalInfoCard(
                              question: "Have you adopt before?",
                              answer: controller.fullInfoForUser
                                          ?.haveYouAdoptBefore ==
                                      '1'
                                  ? "Yes"
                                  : "No",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            AdditionalInfoCard(
                              question:
                                  "Do you have experience with animal care?",
                              answer: controller.fullInfoForUser
                                          ?.haveExperienceWithAnimalCare ==
                                      "1"
                                  ? "Yes"
                                  : "No",
                            ),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            PersonCardInProfilePage(
                              name:
                                  '${controller.fullInfoForUser?.firstName} ${controller.fullInfoForUser?.lastName}',
                              image:
                                  '$linkServerImage${controller.user.usersPhotoUrl}',
                              gmail: controller.fullInfoForUser?.emailAddress,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AdditionalInfoCard(
                              question: "specialization",
                              answer:
                                  controller.additionalInfoForDoctor?.location,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            AdditionalInfoCard(
                              question: "degree?",
                              answer:
                                  controller.additionalInfoForDoctor?.degrees,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            AdditionalInfoCard(
                              question: "licensing information",
                              answer:
                                  controller.additionalInfoForDoctor?.licensing,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            AdditionalInfoCard(
                              question: "Years Experience",
                              answer: controller
                                  .additionalInfoForDoctor?.yearsExperience,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            AdditionalInfoCard(
                              question: "Do you visit home?",
                              answer: controller
                                  .additionalInfoForDoctor?.homeVisits,
                            ),
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

class AdditionalInfoCard extends StatelessWidget {
  const AdditionalInfoCard(
      {super.key, required this.question, required this.answer});

  final String question;
  final String? answer;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              color: ColorsApp.primaryColorOpicaty),
          child: Text(
            question,
            style: AppStyles.urbanistMedium16(context)
                .copyWith(color: ColorsApp.primaryColor),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(10)),
              color: ColorsApp.primaryColorOpicaty),
          child: Text(
            answer ?? "",
            style: AppStyles.urbanistReqular16(context),
          ),
        ),
      ],
    );
  }
}
