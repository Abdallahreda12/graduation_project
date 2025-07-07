import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customCheckBoxList.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/view/signup%20page/widgets/buttonsRow.dart';

class AdditionalInfoEditPage extends StatefulWidget {
  const AdditionalInfoEditPage({super.key});

  @override
  State<AdditionalInfoEditPage> createState() => _AdditionalInfoEditPageState();
}

class _AdditionalInfoEditPageState extends State<AdditionalInfoEditPage> {
  late String firstName = "Abdallah";
  late String lastName = "reda";
  late String ageRangeOfAnimal;
  late String areYouHelper;
  late String lookingForAdoption;
  late String animalsAdoptionPreferred;
  late String haveYouAdoptBefore;
  late String haveExperienceWithAnimalCare;

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
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        initValue: firstName,
                        onDataChanged: (p0) {
                          setState(() {
                            firstName = p0;
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
                        initValue: lastName,
                        onDataChanged: (p0) {
                          setState(() {
                            lastName = p0;
                          });
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
                        defualtAnswer: "Young",
                        options: ["Puppy/Kitten", "Young", "Adult"],
                        question: "Age Range of animals that you preferred",
                        onDataChanged: (p0) {
                          setState(() {
                            ageRangeOfAnimal = p0;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        defualtAnswer: "No",
                        options: ["Yes", "No"],
                        question: "Are you a helper?",
                        onDataChanged: (p0) {
                          setState(() {
                            areYouHelper = p0;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        defualtAnswer: "No",
                        options: ["Yes", "No"],
                        question: "Are you looking for adoption?",
                        onDataChanged: (p0) {
                          setState(() {
                            lookingForAdoption = p0;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        defualtAnswer: "Cat",
                        options: ["Cat", "Dog", "Other (e.g., rabbit, bird)"],
                        question: "Animals adoption preferred",
                        onDataChanged: (p0) {
                          setState(() {
                            animalsAdoptionPreferred = p0;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        defualtAnswer: "Yes",
                        options: ["Yes", "No"],
                        question: "Have you adopted before?",
                        onDataChanged: (p0) {
                          setState(() {
                            haveYouAdoptBefore = p0;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        defualtAnswer: "No",
                        options: ["Yes", "No", "Little knowledge"],
                        question: "Do you have experience with animal care?",
                        onDataChanged: (p0) {
                          setState(() {
                            haveExperienceWithAnimalCare = p0;
                          });
                        },
                      ),
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
              secondButton: "Save",
              firstButtonColor: ColorsApp.primaryColorOpicaty,
              secondButtonAction: () {
                //if (userGlobalKey.currentState!.validate()) {}
                Get.back();
              },
            ),
          ),
        ),
      ]),
    );
  }
}
