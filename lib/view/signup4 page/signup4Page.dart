import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/signUpController.dart';
import 'package:graduation_project/view/signup%20page/widgets/buttonsRow.dart';
import 'package:graduation_project/view/signup4%20page/widgets/custom%20signup4%20textField%20column/customSignUp4TextFieldDoctorColumn.dart';
import 'package:graduation_project/view/signup4%20page/widgets/custom%20signup4%20textField%20column/customSignUp4TextFieldUserColumn.dart';

class Signup4Page extends StatefulWidget {
  const Signup4Page({super.key, this.typeOfUser = ""});
  final String typeOfUser;
  @override
  State<Signup4Page> createState() => _Signup4PageState();
}

class _Signup4PageState extends State<Signup4Page> {
  final controller = Get.find<SignUpControllerImp>();
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
                    onAgeRangeChanged: (value) =>
                        controller.ageRangeOfAnimal = value,
                    onAdoptionStatusChanged: (value) =>
                        controller.lookingForAdoption = value,
                    onAdoptionPreferenceChanged: (value) =>
                        controller.animalsAdoptionPreferred = value,
                    onPreviousAdoptionChanged: (value) =>
                        controller.haveYouAdoptBefore = value,
                    onExperienceChanged: (value) =>
                        controller.haveExperienceWithAnimalCare = value,
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
        : Scaffold(
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SingleChildScrollView(
                    child: CustomSignUp4TextFieldDoctorColumn(
                      onSpecializationChanged: (value) {
                        controller.doctorSpecialization = value;
                      },
                      onDegreesChanged: (value) {
                        controller.doctorDegrees = value;
                      },
                      onLicensingChanged: (value) {
                        controller.doctorLicensing = value;
                      },
                      onExperienceChanged: (value) {
                        controller.doctorYearsExperience = value;
                      },
                      onClinicNameChanged: (value) {
                        controller.clinicName = value;
                      },
                      onClinicAddressChanged: (value) {
                        controller.clinicAddress = value;
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ButtonsRow(
                      secondButtonAction: () {
                        // if (controller.doctorGlobalKey.currentState!.validate()) {
                        //   Get.toNamed("/signup5doctorpage");
                        // }
                        Get.toNamed("/signup5doctorpage");
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
    //
    //signup4 page for institution
    //
  }
}
