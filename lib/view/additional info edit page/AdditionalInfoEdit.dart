import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/Widgets/customCheckBoxList.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';

class AdditionalInfoEditPage extends StatefulWidget {
  const AdditionalInfoEditPage({super.key});

  @override
  State<AdditionalInfoEditPage> createState() => _AdditionalInfoEditPageState();
}

class _AdditionalInfoEditPageState extends State<AdditionalInfoEditPage> {
  late String userName;
  late String userEmailAddress;
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        onDataChanged: (p0) {
                          setState(() {
                            userName = p0;
                          });
                        },
                        text: "Full Name",
                        hintText: "What is your full name",
                        borderradius: 20,
                        validator: (value) =>
                            value!.isEmpty ? "Name is required" : null,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        onDataChanged: (p0) {
                          setState(() {
                            userEmailAddress = p0;
                          });
                        },
                        text: "Email Address",
                        hintText: "What’s your email address",
                        borderradius: 20,
                        validator: (value) => value!.contains('@')
                            ? null
                            : "Please enter a valid email",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomCheckListTile(
                        options: ["Puppy/Kitten", "Young", "Adult"],
                        question: "Age Range of animals that you preferred",
                        onDataChanged: (p0) {
                          setState(() {
                            ageRangeOfAnimal = p0;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        options: ["Yes", "No"],
                        question: "Are you a helper?",
                        onDataChanged: (p0) {
                          setState(() {
                            areYouHelper = p0;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        options: ["Yes", "No"],
                        question: "Are you looking for adoption?",
                        onDataChanged: (p0) {
                          setState(() {
                            lookingForAdoption = p0;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        options: ["Cat", "Dog", "Other (e.g., rabbit, bird)"],
                        question: "Animals adoption preferred",
                        onDataChanged: (p0) {
                          setState(() {
                            animalsAdoptionPreferred = p0;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        options: ["Yes", "No"],
                        question: "Have you adopted before?",
                        onDataChanged: (p0) {
                          setState(() {
                            haveYouAdoptBefore = p0;
                          });
                        },
                      ),
                      CustomCheckListTile(
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
      ]),
    );
  }
}
