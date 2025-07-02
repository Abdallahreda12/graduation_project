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
  late String firstName;
  late String lastName;
  String? userSelectedGender;
  late String userEmailAddress;
  late String userPhoneNumber;
  ////////////////////////////////////////
  //variables used in signup3 page for doctor
  final GlobalKey<FormState> doctorGlobalKey = GlobalKey();
  TextEditingController doctorDateofBirthController = TextEditingController();
  DateTime? doctorSelectedDate;
  late String doctorFirstName;
  late String doctorLastName;
  String? doctorSelectedGender;
  late String doctorEmailAddress;
  late String doctorPhoneNumber;
  ////////////////////////////////////////

  void updateData(String data) {
    setState(() {
      firstName = data;
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
                        onFirstNameChanged: (value) =>
                            setState(() => firstName = value),
                        dateOfBirthController: userDateofBirthController,
                        onDateSelected: (date) =>
                            setState(() => userSelectedDate = date),
                        onPhoneChanged: (value) =>
                            setState(() => userPhoneNumber = value),
                        selectedGender: userSelectedGender,
                        onGenderChanged: (value) =>
                            setState(() => userSelectedGender = value),
                        onLastNameChanged: (value) =>
                            setState(() => lastName = value),
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
                        onUploadPhoto: pickImages,
                        selectedImages: selectedImage,
                      ),
                      const SizedBox(height: 25),
                      //
                      // Form Fields
                      //
                      CustomSignUp3FormDoctorPage(
                        formKey: doctorGlobalKey,
                        onFirstNameChanged: (value) =>
                            setState(() => doctorFirstName = value),
                        onLastNameChanged: (value) =>
                            setState(() => doctorLastName = value),
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
          );
    //
    //signup3 page for institution
    //
  }
}
