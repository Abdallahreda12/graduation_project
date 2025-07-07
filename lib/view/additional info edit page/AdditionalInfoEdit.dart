import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/profileController.dart';
import 'package:graduation_project/core/Widgets/customCheckBoxList.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/view/additional%20info%20edit%20page/widgets/uploadPhoto.dart';
import 'package:graduation_project/view/signup%20page/widgets/buttonsRow.dart';

class AdditionalInfoEditPage extends StatefulWidget {
  const AdditionalInfoEditPage({super.key});

  @override
  State<AdditionalInfoEditPage> createState() => _AdditionalInfoEditPageState();
}

class _AdditionalInfoEditPageState extends State<AdditionalInfoEditPage> {
  final controller = Get.find<ProfileControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      body: Stack(fit: StackFit.expand, children: [
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //
                      //upload photo
                      //
                      // EditePhoto(
                      //   onUploadPhoto: controller.pickImages,
                      //   selectedImages: controller.selectedImage,
                      // ),s
                      UploadphotoInAdditionalInfoEdit(
                        onUploadPhoto: controller.pickImages,
                        selectedImages: controller.selectedImageFiles,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        controller:
                            controller.textEditingControllerForFirstName,
                        initValue:
                            controller.textEditingControllerForFirstName.text,
                        onDataChanged: (p0) {
                          setState(() {
                            controller.fullInfoForUser!.firstName = p0;
                          });
                        },
                        text: "First Name",
                        hintText: "What is your full name",
                        borderradius: 20,
                        validator: (value) =>
                            value!.isEmpty ? "Name is required" : null,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        controller: controller.textEditingControllerforLastName,
                        initValue:
                            controller.textEditingControllerforLastName.text,
                        onDataChanged: (p0) {
                          controller.fullInfoForUser!.lastName = p0;
                        },
                        text: "last Name",
                        hintText: "What is your full name",
                        borderradius: 20,
                        validator: (value) =>
                            value!.isEmpty ? "Name is required" : null,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomCheckListTile(
                        defualtAnswer:
                            controller.fullInfoForUser!.ageRangeOfAnimal,
                        options: ["Puppy/Kitten", "Young", "Adult"],
                        question: "Age Range of animals that you preferred",
                        onDataChanged: (p0) {
                          setState(() {
                            controller.fullInfoForUser!.ageRangeOfAnimal = p0;
                          });
                        },
                      ),

                      CustomCheckListTile(
                          defualtAnswer:
                              controller.fullInfoForUser!.lookingForAdoption ==
                                      "1"
                                  ? "Yes"
                                  : "No",
                          options: ["Yes", "No"],
                          question: "Are you looking for adoption?",
                          onDataChanged: (p0) {
                            setState(() {
                              controller.fullInfoForUser!.lookingForAdoption =
                                  p0 == "Yes" ? "1" : "0";
                            });
                          }),
                      CustomCheckListTile(
                        defualtAnswer: controller
                            .fullInfoForUser!.animalsAdoptionPreferred,
                        options: ["Cat", "Dog", "Other (e.g., rabbit, bird)"],
                        question: "Animals adoption preferred",
                        onDataChanged: (p0) {
                          setState(() {
                            controller
                                .fullInfoForUser!.animalsAdoptionPreferred = p0;
                          });
                        },
                      ),
                      CustomCheckListTile(
                          defualtAnswer:
                              controller.fullInfoForUser!.haveYouAdoptBefore ==
                                      "1"
                                  ? "Yes"
                                  : "No",
                          options: ["Yes", "No"],
                          question: "Have you adopted before?",
                          onDataChanged: (p0) {
                            setState(() {
                              controller.fullInfoForUser!.haveYouAdoptBefore =
                                  p0 == "Yes" ? "1" : "0";
                            });
                          }),
                      CustomCheckListTile(
                          defualtAnswer: controller.fullInfoForUser!
                                      .haveExperienceWithAnimalCare ==
                                  "1"
                              ? "Yes"
                              : "No",
                          options: ["Yes", "No"],
                          question: "Do you have experience with animal care?",
                          onDataChanged: (p0) {
                            setState(() {
                              controller.fullInfoForUser!
                                      .haveExperienceWithAnimalCare =
                                  p0 == "Yes" ? "1" : "0";
                            });
                          }),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
            child: ButtonsRow(
              firstButtonAction: () {
                Get.toNamed("/additionalinfopage");
              },
              secondButton: "Save",
              firstButtonColor: ColorsApp.primaryColorOpicaty,
              secondButtonAction: () async {
                await controller.editeAdditionalInfo();
                Get.toNamed("/additionalinfopage");
              },
            ),
          ),
        ),
      ]),
    );
  }
}
