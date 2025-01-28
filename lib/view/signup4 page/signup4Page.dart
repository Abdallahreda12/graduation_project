import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/Widgets/customCheckBoxList.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/buttonsRow.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';

class Signup4Page extends StatefulWidget {
  const Signup4Page({super.key, this.typeOfUser = ""});
  final String typeOfUser;
  @override
  State<Signup4Page> createState() => _Signup4PageState();
}

class _Signup4PageState extends State<Signup4Page> {
  //variables used in signup4 page for user
  late String ageRangeOfAnimal;
  late String areYouHelper;
  late String lookingForAdoption;
  late String animalsAdoptionPreferred;
  late String haveYouAdoptBefore;
  late String haveExperienceWithAnimalCare;
  ////////////////////////////////////////
  //variables used in signup4 page for doctor
  late String doctorSpecialization;
  late String doctorDegrees;
  late String doctorLicensing;
  late String doctorYearsExperience;
  late String clinicName;
  late String clinicAddress;
  ////////////////////////////////////////
  /////variables used in signup4 page for institution
  late String institutionOperatingHours;
  late String institutionTypesAnimals;
  late String institutionServiceAreas;
  late String institutionMissionStatment;
  late String institutionAdoptonPolicies;
  /////////////////////////////////////////
  void updateData(String data) {
    setState(() {
      // userName = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.typeOfUser == "User"
        //
        //signup4 page for user
        //
        ? Scaffold(
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: Stack(fit: StackFit.expand, children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      //
                      //Steps Row
                      //
                      StepsRow(currentIndex: 4),
                      const SizedBox(height: 25),
                      Text(
                        "Personal Information",
                        style: AppStyles.urbanistMedium22(context),
                      ),
                      const SizedBox(height: 25),
                      CustomCheckListTile(
                        options: ["Puppy/Kitten", "Young", "Adult"],
                        question: "Age Range of animals that you preferred",
                        onDataChanged: (String e) {
                          setState(() {
                            ageRangeOfAnimal = e;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        options: [
                          "Yes",
                          "No",
                        ],
                        question: "Are you helper?",
                        onDataChanged: (String e) {
                          setState(() {
                            areYouHelper = e;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        options: [
                          "Yes",
                          "No",
                        ],
                        question: "Are you looking for adoption?",
                        onDataChanged: (String e) {
                          setState(() {
                            lookingForAdoption = e;
                          });
                        },
                      ),

                      CustomCheckListTile(
                        options: ["Cat", "Dog", "Other (e.g., rabbit, bird)"],
                        question: "Animals adoption preferred",
                        onDataChanged: (String e) {
                          setState(() {
                            animalsAdoptionPreferred = e;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        options: [
                          "Yes",
                          "No",
                        ],
                        question: "Have you adopt before?",
                        onDataChanged: (String e) {
                          setState(() {
                            haveYouAdoptBefore = e;
                          });
                        },
                      ),
                      CustomCheckListTile(
                        options: ["Yes", "No", "Little knowledge"],
                        question: "Do you have experience with animal care",
                        onDataChanged: (String e) {
                          setState(() {
                            haveExperienceWithAnimalCare = e;
                          });
                        },
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ), //
                // Buttons Row
                //
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: ButtonsRow(
                    secondButtonAction: () {
                      //if (userGlobalKey.currentState!.validate()) {}
                      Get.toNamed("/signup5userpage");
                    },
                  ),
                ),
              ]),
            ),
          )
        //
        //signup4 page for doctor
        //
        : widget.typeOfUser == "Doctor"
            ? Scaffold(
                resizeToAvoidBottomInset: true,
                body: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            //
                            //Steps Row
                            //
                            StepsRow(currentIndex: 4),
                            //
                            //Professional Credentials
                            //
                            const SizedBox(height: 25),
                            Text(
                              "Clinic Details",
                              style: AppStyles.urbanistMedium22(context),
                            ),
                            const SizedBox(height: 25),
                            CustomTextField(
                              onDataChanged: (p0) {
                                setState(() {
                                  doctorSpecialization = p0;
                                });
                              },
                              text: "Specialization",
                              hintText: "What’s your Specialized?",
                              borderradius: 20,
                              validator: (value) {
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              onDataChanged: (p0) {
                                setState(() {
                                  doctorDegrees = p0;
                                });
                              },
                              text: "Degrees and Certifications",
                              hintText: "Your Academic degree",
                              borderradius: 20,
                              validator: (value) {
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              onDataChanged: (p0) {
                                setState(() {
                                  doctorLicensing = p0;
                                });
                              },
                              text: "Licensing Information",
                              hintText: "Your license number",
                              borderradius: 20,
                              validator: (value) {
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              onDataChanged: (p0) {
                                setState(() {
                                  doctorYearsExperience = p0;
                                });
                              },
                              text: "Years Experience",
                              hintText: "Years Experience",
                              borderradius: 20,
                              validator: (value) {
                                return null;
                              },
                            ),
                            //
                            //Clinic Details
                            //
                            const SizedBox(height: 25),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Clinic Details",
                                  style: AppStyles.urbanistMedium22(context),
                                ),
                                Text(
                                  "Not required if you don't have clinic",
                                  style: AppStyles.urbanistReqular14(context)
                                      .copyWith(color: Colors.grey),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              onDataChanged: (p0) {
                                setState(() {
                                  clinicName = p0;
                                });
                              },
                              text: "Clinic Name",
                              hintText: "What’s your clinic name?",
                              borderradius: 20,
                              validator: (value) {
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              onDataChanged: (p0) {
                                setState(() {
                                  clinicAddress = p0;
                                });
                              },
                              text: "Clinic Address",
                              hintText: "City/Pincode",
                              borderradius: 20,
                              validator: (value) {
                                return null;
                              },
                            ),
                            const SizedBox(height: 25),
                            //
                            // Buttons Row
                            //
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ButtonsRow(
                          secondButtonAction: () {
                            // if (doctorGlobalKey.currentState!.validate()) {}
                            Get.toNamed("/signup5doctorpage");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            //
            //signup4 page for institution
            //
            : Scaffold(
                resizeToAvoidBottomInset: true,
                body: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Stack(fit: StackFit.expand, children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          //
                          //Steps Row
                          //
                          StepsRow(currentIndex: 4),
                          //
                          //Professional Credentials
                          //
                          const SizedBox(height: 25),
                          Text(
                            "Operational Details",
                            style: AppStyles.urbanistMedium22(context),
                          ),
                          const SizedBox(height: 25),
                          CustomTextField(
                            onDataChanged: (p0) {
                              setState(() {
                                institutionOperatingHours = p0;
                              });
                            },
                            text: "Operating Hours",
                            hintText: "What’s your Operating Hours?",
                            borderradius: 20,
                            validator: (value) {
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            onDataChanged: (p0) {
                              setState(() {
                                institutionTypesAnimals = p0;
                              });
                            },
                            text: "Types of Animals",
                            hintText:
                                " Specify the types of animals they handle",
                            borderradius: 20,
                            validator: (value) {
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            onDataChanged: (p0) {
                              setState(() {
                                institutionServiceAreas = p0;
                              });
                            },
                            text: "Service Areas",
                            hintText:
                                "Geographic regions the institution serves",
                            borderradius: 20,
                            validator: (value) {
                              return null;
                            },
                          ),
                          //
                          //Institution Mission and Policies
                          //
                          const SizedBox(height: 25),
                          Text(
                            "Institution Mission and Policies",
                            style: AppStyles.urbanistMedium22(context),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            onDataChanged: (p0) {
                              setState(() {
                                institutionMissionStatment = p0;
                              });
                            },
                            text: "Mission Statement",
                            hintText:
                                "brief description of the institution's goals and values.",
                            borderradius: 20,
                            validator: (value) {
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            onDataChanged: (p0) {
                              setState(() {
                                institutionAdoptonPolicies = p0;
                              });
                            },
                            text: "Adoption Policies",
                            hintText:
                                "Rules regarding who can adopt and under what conditions.",
                            borderradius: 20,
                            validator: (value) {
                              return null;
                            },
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ButtonsRow(
                        secondButtonAction: () {
                          // if (doctorGlobalKey.currentState!.validate()) {}
                          Get.toNamed("/signup5institutionpage");
                        },
                      ),
                    ),
                  ]),
                ),
              );
  }
}
