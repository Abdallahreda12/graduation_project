import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/clinicContriller.dart';
import 'package:graduation_project/controller/signUpController.dart';
import 'package:graduation_project/core/class/handleWidgets.dart';
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
  ClinicController clinicController = Get.put(ClinicController());

  @override
  Widget build(BuildContext context) {
    return widget.typeOfUser == "User"
        //
        //signup4 page for user
        //
        ? Scaffold(
            resizeToAvoidBottomInset: true,
            body: HandleLoadingIndicator(
              isLoading: controller.isLoading,
              widget: Padding(
                padding: const EdgeInsets.all(25),
                child: Stack(fit: StackFit.expand, children: [
                  SingleChildScrollView(
                    child: CustomSignUp4TextFieldUserColumn(
                      onAgeRangeChanged: (value) {
                        controller.updateUserInfo(ageRangeOfAnimal: value);
                      },
                      onAdoptionStatusChanged: (value) {
                        controller.updateUserInfo(lookingForAdoption: value);
                      },
                      onAdoptionPreferenceChanged: (value) {
                        controller.updateUserInfo(
                            animalsAdoptionPreferred: value);
                      },
                      onPreviousAdoptionChanged: (value) {
                        controller.updateUserInfo(haveYouAdoptBefore: value);
                      },
                      onExperienceChanged: (value) {
                        controller.updateUserInfo(
                            haveExperienceWithAnimalCare: value);
                      },
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
                        // Optional: Add validation here if needed
                        // if (controller.userGlobalKey.currentState!.validate()) {
                        Get.toNamed("/signup5userpage");
                        // }
                      },
                    ),
                  ),
                ]),
              ),
            ),
          )
        //
        //signup4 page for doctor
        //
        : Scaffold(
            resizeToAvoidBottomInset: true,
            body: HandleLoadingIndicator(
              isLoading: controller.isLoading,
              widget: Padding(
                padding: const EdgeInsets.all(25),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: CustomSignUp4TextFieldDoctorColumn(
                        onSpecializationChanged: (value) {
                          controller.updateDoctorInfo(specialization: value);
                        },
                        onDegreesChanged: (value) {
                          controller.updateDoctorInfo(degrees: value);
                        },
                        onLicensingChanged: (value) {
                          controller.updateDoctorInfo(licensing: value);
                        },
                        onExperienceChanged: (value) {
                          controller.updateDoctorInfo(yearsExperience: value);
                        },
                        onClinicNameChanged: (value) {
                          controller.updateDoctorInfo(clinicName: value);
                        },
                        onClinicAddressChanged: (value) {
                          controller.updateDoctorInfo(clinicAddress: value);
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ButtonsRow(secondButtonAction: () async {
                        print(controller.doctorInfo?.licensing);
                        print(controller.doctorInfo?.yearsExperience);
                        print(controller.doctorInfo?.clinicAddress);
                        print("object");
                        // if (controller.doctorGlobalKey.currentState!
                        //     .validate()) {
                        print("objectsss");
                        await clinicController.addMultipleClinics(
                          userid: controller.userId.toString(),
                          phone: controller.doctorInfo?.phoneNumber ?? "",
                          clinics: clinicController.clinics,
                        );
                        Get.toNamed("/signup5doctorpage");
                      }
                          //},
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
