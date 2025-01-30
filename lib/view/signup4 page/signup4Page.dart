import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/buttonsRow.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';
import 'package:graduation_project/view/signup4%20page/widgets/custom%20signup4%20textField%20column/customSignUp4TextFieldDoctorColumn.dart';
import 'package:graduation_project/view/signup4%20page/widgets/custom%20signup4%20textField%20column/customSignUp4TextFieldInstitutionColumn.dart';
import 'package:graduation_project/view/signup4%20page/widgets/custom%20signup4%20textField%20column/customSignUp4TextFieldUserColumn.dart';

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
                  child: CustomSignUp4TextFieldUserColumn(
                    onAgeRangeChanged: (value) => setState(() {
                      ageRangeOfAnimal = value;
                    }),
                    onHelperStatusChanged: (value) => setState(() {
                      areYouHelper = value;
                    }),
                    onAdoptionStatusChanged: (value) => setState(() {
                      lookingForAdoption = value;
                    }),
                    onAdoptionPreferenceChanged: (value) => setState(() {
                      animalsAdoptionPreferred = value;
                    }),
                    onPreviousAdoptionChanged: (value) => setState(() {
                      haveYouAdoptBefore = value;
                    }),
                    onExperienceChanged: (value) => setState(() {
                      haveExperienceWithAnimalCare = value;
                    }),
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
                        child: CustomSignUp4TextFieldDoctorColumn(
                          onSpecializationChanged: (value) {
                            setState(() {
                              doctorSpecialization = value;
                            });
                          },
                          onDegreesChanged: (value) {
                            setState(() {
                              doctorDegrees = value;
                            });
                          },
                          onLicensingChanged: (value) {
                            setState(() {
                              doctorLicensing = value;
                            });
                          },
                          onExperienceChanged: (value) {
                            setState(() {
                              doctorYearsExperience = value;
                            });
                          },
                          onClinicNameChanged: (value) {
                            setState(() {
                              clinicName = value;
                            });
                          },
                          onClinicAddressChanged: (value) {
                            setState(() {
                              clinicAddress = value;
                            });
                          },
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
                      child: CustomSignUp4TextFieldInstitutionColumn(
                        onOperatingHoursChanged: (value) {
                          setState(() {
                            // Update the value as needed
                          });
                        },
                        onTypesAnimalsChanged: (value) {
                          setState(() {
                            // Update the value as needed
                          });
                        },
                        onServiceAreasChanged: (value) {
                          setState(() {
                            // Update the value as needed
                          });
                        },
                        onMissionStatementChanged: (value) {
                          setState(() {
                            // Update the value as needed
                          });
                        },
                        onAdoptionPoliciesChanged: (value) {
                          setState(() {
                            // Update the value as needed
                          });
                        },
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
