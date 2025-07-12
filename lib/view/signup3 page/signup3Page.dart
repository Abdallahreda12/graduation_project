import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/signUpController.dart';
import 'package:graduation_project/core/class/handleWidgets.dart';
import 'package:graduation_project/core/util/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return widget.typeOfUser == "User"
        ? _buildUserForm(context)
        : _buildDoctorForm(context);
  }

 // Updated parts of your Signup3Page class

Widget _buildUserForm(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: true,
    body: HandleLoadingIndicator(
      isLoading: controller.isLoading,
      widget: Padding(
        padding: const EdgeInsets.all(25),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  StepsRow(currentIndex: 4),
                  const SizedBox(height: 25),
                  Text(
                    "Personal Information",
                    style: AppStyles.urbanistMedium22(context),
                  ),
                  const SizedBox(height: 25),
                  CustomUploadPhotoSignUp3UserPage(
                    onUploadPhoto: controller.pickImages,
                    selectedImages: controller.selectedImage,
                  ),
                  const SizedBox(height: 25),
                  CustomSignUp3FormUserPage(
                    formKey: controller.userGlobalKey,
                    onFirstNameChanged: (value) {
                      controller.updateUserInfo(firstName: value);
                    },
                    onLastNameChanged: (value) {
                      controller.updateUserInfo(lastName: value);
                    },
                    onPhoneChanged: (value) {
                      controller.updateUserInfo(phoneNumber: value);
                    },
                    onGenderChanged: (value) {
                      controller.userInfo?.gender = value;
                      controller.updateUserInfo(gender: value);
                    },
                    selectedGender: controller.userInfo?.gender,
                    dateOfBirthController: controller.userDateofBirthController,
                    onDateSelected: (date) {
                      controller.userSelectedDate = date;
                      controller.updateUserInfo(birthday: date.toString());
                    },
                    // Add location selection functionality
                    onLocationSelected: controller.onLocationSelected,
                    initialGovernorate: controller.selectedGovernorate,
                    initialCity: controller.selectedCity,
                  ),
                  const SizedBox(height: 25),
                  
                  // Optional: Add buttons for current location and map
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: ElevatedButton.icon(
                  //         onPressed: controller.getLinkInCurrentLocation,
                  //         icon: const Icon(Icons.my_location),
                  //         label: const Text("Use Current Location"),
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: ColorsApp.primaryColor.withOpacity(0.1),
                  //           foregroundColor: ColorsApp.primaryColor,
                  //           elevation: 0,
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10),
                  //     Expanded(
                  //       child: ElevatedButton.icon(
                  //         onPressed: () => controller.openMap(context),
                  //         icon: const Icon(Icons.map),
                  //         label: const Text("Open Map"),
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: ColorsApp.primaryColor.withOpacity(0.1),
                  //           foregroundColor: ColorsApp.primaryColor,
                  //           elevation: 0,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  
                  const SizedBox(height: 70),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: ButtonsRow(
                secondButtonAction: () {
                  if (controller.userGlobalKey.currentState!.validate()) {
                    // Check if location is selected
                    if (controller.selectedGovernorate == null || controller.selectedCity == null) {
                      Get.snackbar(
                        'Location Required',
                        'Please select your governorate and city',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: ColorsApp.errorColor,
                        colorText: Colors.white,
                      );
                      return;
                    }
                    Get.toNamed("/signup4userpage");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Similar update for _buildDoctorForm
Widget _buildDoctorForm(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: true,
    body: HandleLoadingIndicator(
      isLoading: controller.isLoading,
      widget: Padding(
        padding: const EdgeInsets.all(25),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  StepsRow(currentIndex: 4),
                  const SizedBox(height: 25),
                  Text(
                    "Personal Information",
                    style: AppStyles.urbanistMedium22(context),
                  ),
                  const SizedBox(height: 25),
                  CustomUploadPhotoSignUp3DoctorPage(
                    onUploadPhoto: controller.pickImages,
                    selectedImages: controller.selectedImage,
                  ),
                  const SizedBox(height: 25),
                  CustomSignUp3FormDoctorPage(
                    formKey: controller.doctorGlobalKey,
                    onFirstNameChanged: (value) {
                      controller.updateDoctorInfo(firstName: value);
                    },
                    onLastNameChanged: (value) {
                      controller.updateDoctorInfo(lastName: value);
                    },
                    onEmailChanged: (value) {
                      controller.updateDoctorInfo(emailAddress: value);
                    },
                    onPhoneChanged: (value) {
                      controller.updateDoctorInfo(phoneNumber: value);
                    },
                    dateController: controller.doctorDateofBirthController,
                    onDatePicked: (date) {
                      controller.doctorSelectedDate = date;
                      controller.updateDoctorInfo(birthday: date.toString());
                    },
                    selectedGender: controller.doctorInfo?.gender,
                    onGenderSelected: (value) {
                      controller.doctorInfo?.gender = value;
                      controller.updateDoctorInfo(gender: value);
                    },
                    // Add location selection for doctor form too
                    onLocationSelected: controller.onLocationSelected,
                    initialGovernorate: controller.selectedGovernorate,
                    initialCity: controller.selectedCity,
                  ),
                  const SizedBox(height: 25),
                  
                  // Optional: Add buttons for current location and map
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: ElevatedButton.icon(
                  //         onPressed: controller.getLinkInCurrentLocation,
                  //         icon: const Icon(Icons.my_location),
                  //         label: const Text("Use Current Location"),
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: ColorsApp.primaryColor.withOpacity(0.1),
                  //           foregroundColor: ColorsApp.primaryColor,
                  //           elevation: 0,
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10),
                  //     Expanded(
                  //       child: ElevatedButton.icon(
                  //         onPressed: () => controller.openMap(context),
                  //         icon: const Icon(Icons.map),
                  //         label: const Text("Open Map"),
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: ColorsApp.primaryColor.withOpacity(0.1),
                  //           foregroundColor: ColorsApp.primaryColor,
                  //           elevation: 0,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  
                  const SizedBox(height: 70),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: ButtonsRow(
                secondButtonAction: () {
                  if (controller.doctorGlobalKey.currentState!.validate()) {
                    // Check if location is selected
                    if (controller.selectedGovernorate == null || controller.selectedCity == null) {
                      Get.snackbar(
                        'Location Required',
                        'Please select your governorate and city',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return;
                    }
                    Get.toNamed("/signup4doctorpage");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}