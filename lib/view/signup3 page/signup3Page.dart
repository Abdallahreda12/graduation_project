import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/signUpController.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/buttonsRow.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';
import 'package:graduation_project/view/signup3%20page/widgets/CustomUploadPhotoSignUp3DoctorPage.dart';
import 'package:graduation_project/view/signup3%20page/widgets/CustomUploadPhotoSignUp3UserPage%20copy.dart';
import 'package:graduation_project/view/signup3%20page/widgets/custom%20Signup3%20Form/customSignUp3FormDoctorPage.dart';
import 'package:graduation_project/view/signup3%20page/widgets/custom%20Signup3%20Form/customSignUp3FormUserPage.dart';

class Signup3Page extends StatefulWidget {
  const Signup3Page({super.key, this.typeOfUser = ""});
  final String typeOfUser;
  @override
  State<Signup3Page> createState() => _Signup3PageState();
}

class _Signup3PageState extends State<Signup3Page> {
  final controller = Get.find<SignUpControllerImp>();

  void updateData(String data) {
    setState(() {
      controller.userfirstName = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.typeOfUser == "User"
        //
        //signup3 page for user
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
                      StepsRow(currentIndex: 3),
                      const SizedBox(height: 25),
                      Text(
                        "Personal Information",
                        style: AppStyles.urbanistMedium22(context),
                      ),
                      const SizedBox(height: 25),
                      //
                      //Upload photo
                      //
                      CustomUploadPhotoSignUp3UserPage(
                        onUploadPhoto: controller.pickImages,
                        selectedImages: controller.selectedImage,
                      ),
                      const SizedBox(height: 25),
                      //
                      // Form Fields
                      //
                      CustomSignUp3FormUserPage(
                        formKey: controller.userGlobalKey,
                        onFirstNameChanged: (value) =>
                            setState(() => controller.userfirstName = value),
                        dateOfBirthController:
                            controller.userDateofBirthController,
                        onDateSelected: (date) =>
                            setState(() => controller.userSelectedDate = date),
                        onPhoneChanged: (value) =>
                            setState(() => controller.userPhoneNumber = value),
                        selectedGender: controller.userSelectedGender,
                        onGenderChanged: (value) => setState(
                            () => controller.userSelectedGender = value),
                        onLastNameChanged: (value) =>
                            setState(() => controller.userlastName = value),
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
                //
                // Buttons Row
                //
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: ButtonsRow(
                    secondButtonAction: () {
                      // if (controller.userGlobalKey.currentState!.validate()) {
                      Get.toNamed("/signup4userpage");
                      //}
                    },
                  ),
                ),
              ]),
            ),
          )
        //
        //signup3 page for doctor
        //
        : Scaffold(
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
                      StepsRow(currentIndex: 3),
                      const SizedBox(height: 25),
                      Text(
                        "Personal Information",
                        style: AppStyles.urbanistMedium22(context),
                      ),
                      const SizedBox(height: 25),
                      //
                      //Upload photo
                      //
                      CustomUploadPhotoSignUp3DoctorPage(
                        onUploadPhoto: controller.pickImages,
                        selectedImages: controller.selectedImage,
                      ),
                      const SizedBox(height: 25),
                      //
                      // Form Fields
                      //
                      CustomSignUp3FormDoctorPage(
                        formKey: controller.doctorGlobalKey,
                        onFirstNameChanged: (value) =>
                            setState(() => controller.doctorFirstName = value),
                        onLastNameChanged: (value) =>
                            setState(() => controller.doctorLastName = value),
                        onEmailChanged: (value) => setState(
                            () => controller.doctorEmailAddress = value),
                        onPhoneChanged: (value) => setState(
                            () => controller.doctorPhoneNumber = value),
                        dateController: controller.doctorDateofBirthController,
                        onDatePicked: (value) => setState(
                            () => controller.doctorSelectedDate = value),
                        onGenderSelected: (value) => setState(
                            () => controller.doctorSelectedGender = value),
                        selectedGender: controller.doctorSelectedGender,
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
                //
                // Buttons Row
                //
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: ButtonsRow(
                    secondButtonAction: () {
                      //if (controller.doctorGlobalKey.currentState!.validate()) {
                      Get.toNamed("/signup4doctorpage");
                      //}
                    },
                  ),
                ),
              ]),
            ),
          );
    //
    //signup3 page for institution
    //
  }
}
