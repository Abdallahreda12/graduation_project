import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/buttonsRow.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';
import 'package:graduation_project/view/signup3%20page/widgets/CustomUploadPhotoSignUp3DoctorPage.dart';
import 'package:graduation_project/view/signup3%20page/widgets/CustomUploadPhotoSignUp3UserPage%20copy.dart';
import 'package:graduation_project/view/signup3%20page/widgets/custom%20Signup3%20Form/customSignUp3FormDoctorPage.dart';
import 'package:graduation_project/view/signup3%20page/widgets/custom%20Signup3%20Form/customSignUp3FormInstitutionPage.dart';
import 'package:graduation_project/view/signup3%20page/widgets/custom%20Signup3%20Form/customSignUp3FormUserPage.dart';

class Signup3Page extends StatefulWidget {
  const Signup3Page({super.key, this.typeOfUser = ""});
  final String typeOfUser;
  @override
  State<Signup3Page> createState() => _Signup3PageState();
}

class _Signup3PageState extends State<Signup3Page> {
  //variables used in signup3 page for user
  final GlobalKey<FormState> userGlobalKey = GlobalKey();
  TextEditingController userDateofBirthController = TextEditingController();
  DateTime? userSelectedDate;
  late String userName;
  String? userSelectedGender;
  late String userEmailAddress;
  late String userPhoneNumber;
  ////////////////////////////////////////
  //variables used in signup3 page for doctor
  final GlobalKey<FormState> doctorGlobalKey = GlobalKey();
  TextEditingController doctorDateofBirthController = TextEditingController();
  DateTime? doctorSelectedDate;
  late String doctorName;
  String? doctorSelectedGender;
  late String doctorEmailAddress;
  late String doctorPhoneNumber;
  ////////////////////////////////////////
  /////variables used in signup3 page for institution
  final GlobalKey<FormState> institutionGlobalKey = GlobalKey();
  late String institutionName;
  late String institutionDescription;
  late String institutionRegistrationDetails;
  late String institutionWebsite;
  late String institutionFacebookLink;
  late String institutionEmailAddress;
  late String institutionPhoneNumber;
  /////////////////////////////////////////
  void updateData(String data) {
    setState(() {
      userName = data;
    });
  }

  //to put on it images
  File? selectedImage;
  //
  //function to pick images
  //
  Future<void> pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedImage = File(result.files.single.path!);
      });
    }
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
                        onUploadPhoto: pickImages,
                        selectedImages: selectedImage,
                      ),
                      const SizedBox(height: 25),
                      //
                      // Form Fields
                      //
                      CustomSignUp3FormUserPage(
                        formKey: userGlobalKey,
                        onNameChanged: (value) =>
                            setState(() => userName = value),
                        dateOfBirthController: userDateofBirthController,
                        onDateSelected: (date) =>
                            setState(() => userSelectedDate = date),
                        onEmailChanged: (value) =>
                            setState(() => userEmailAddress = value),
                        onPhoneChanged: (value) =>
                            setState(() => userPhoneNumber = value),
                        selectedGender: userSelectedGender,
                        onGenderChanged: (value) =>
                            setState(() => userSelectedGender = value),
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
                      //if (userGlobalKey.currentState!.validate()) {
                      // Get.toNamed("/signup4userpage");
                      //}
                      Get.toNamed("/signup4userpage");
                    },
                  ),
                ),
              ]),
            ),
          )
        //
        //signup3 page for doctor
        //
        : widget.typeOfUser == "Doctor"
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
                          CustomUploadPhotoSignUp3DoctorPage(
                            onUploadPhoto: () {
                              //Handle Upload photo
                            },
                          ),
                          const SizedBox(height: 25),
                          //
                          // Form Fields
                          //
                          CustomSignUp3FormDoctorPage(
                            formKey: doctorGlobalKey,
                            onNameChanged: (value) =>
                                setState(() => doctorName = value),
                            onEmailChanged: (value) =>
                                setState(() => doctorEmailAddress = value),
                            onPhoneChanged: (value) =>
                                setState(() => doctorPhoneNumber = value),
                            dateController: doctorDateofBirthController,
                            onDatePicked: (value) =>
                                setState(() => doctorSelectedDate = value),
                            onGenderSelected: (value) =>
                                setState(() => doctorSelectedGender = value),
                            selectedGender: doctorSelectedGender,
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
                          // if (doctorGlobalKey.currentState!.validate()) {
                          // Get.toNamed("/signup4doctorpage");
                          //}
                          Get.toNamed("/signup4doctorpage");
                        },
                      ),
                    ),
                  ]),
                ),
              )
            //
            //signup3 page for institution
            //
            : Scaffold(
                resizeToAvoidBottomInset: true,
                body: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Stack(fit: StackFit.expand, children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          //
                          //Steps Row
                          //
                          StepsRow(currentIndex: 3),
                          const SizedBox(height: 25),
                          Text(
                            "Institution Information",
                            style: AppStyles.urbanistMedium22(context),
                          ),
                          const SizedBox(height: 25),
                          //
                          // Form Fields
                          //
                          CustomSignUp3FormInstitutionPage(
                            formKey: userGlobalKey,
                            onNameChanged: (value) => setState(() {
                              institutionName = value;
                            }),
                            onDescriptionChanged: (value) => setState(() {
                              institutionDescription = value;
                            }),
                            onRegistrationChanged: (value) => setState(() {
                              institutionRegistrationDetails = value;
                            }),
                            onWebsiteChanged: (value) => setState(() {
                              institutionWebsite = value;
                            }),
                            onFacebookChanged: (value) => setState(() {
                              institutionFacebookLink = value;
                            }),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: ButtonsRow(
                        secondButtonAction: () {
                          // if (userGlobalKey.currentState!.validate()) {
                          //Get.toNamed("/signup4institutionpage");
                          //}
                          Get.toNamed("/signup4institutionpage");
                        },
                      ),
                    ),
                  ]),
                ),
              );
  }
}
