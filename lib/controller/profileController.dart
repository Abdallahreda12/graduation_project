import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/loginController.dart';
import 'package:graduation_project/controller/signUpController.dart';
import 'package:graduation_project/data/models/userInfo.dart';
import 'package:graduation_project/data/services/editAddionalIInfoData.dart';
import 'package:graduation_project/data/services/editProfileData.dart';
import 'package:graduation_project/locale/locale_controller.dart';
import 'package:graduation_project/theme/themeController.dart';

abstract class ProfileController extends GetxController {
  gotoAdditionalInfo();
  changeLang(value);
  changeTheme(value);
  editProfile();
  showPopupMenu(context);
  // editeAdditionalInfo();
}

class ProfileControllerImp extends ProfileController {
  bool isLoading = false;

  late int userId;
  late UserModel user;

  late ThemeController themeController;
  late MylocaleController langController;

  String selectedTheme = 'Light';
  String selectedLanguage = 'Eng';
  String notificationStatus = "Allow";

  IconData icon = Icons.edit_sharp;
  late TextEditingController textEditingController;
  DateTime? selectedDate;
  String selectedGender = 'None';

  List<File> selectedImageFiles = [];

  @override
  void onInit() async {
    final LoginControllerImp loginController = Get.find();
    user = loginController.user;
    userId = user.userId;

    //themeController = Get.find<ThemeController>();
    langController = Get.find<MylocaleController>();

    String? savedLang = await langController.getSavedLanguage();
    selectedLanguage = (savedLang == 'ar') ? 'Arb' : 'Eng';

    //final isDark = themeController.isDarkMode.value;
    //selectedTheme = isDark ? 'Dark' : 'Light';

    update(); // Refresh UI

    super.onInit();
  }

//
//
  @override
  gotoAdditionalInfo() {
    Get.toNamed("/additionalinfopage");
  }

//
//
  @override
  changeLang(value) {
    selectedLanguage = value!;
    langController.changLang(value == "Eng" ? 'en' : 'ar');
    update();
  }

//
//
  @override
  changeTheme(value) {
    selectedTheme = value!;
    themeController.toggleTheme();
    update();
  }

//
//
  @override
  void showPopupMenu(context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final buttonPosition = button.localToGlobal(Offset.zero);
    final buttonSize = button.size;

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx + buttonSize.width, // Left position
        buttonPosition.dy + buttonSize.height, // Top position
        buttonPosition.dx, // Right position
        buttonPosition.dy + buttonSize.height, // Bottom
      ),
      items: [
        PopupMenuItem<String>(
          value: 'Male',
          child: Text('Male'),
        ),
        PopupMenuItem<String>(
          value: 'Female',
          child: Text('Female'),
        ),
      ],
    );

    if (selected != null) {
      selectedGender = selected;
      update();
      user.usersGender = selectedGender;
      update();
      textEditingController = TextEditingController(text: selectedGender);
      update();
      await editProfile();
    }
  }

//
//
  @override
  editProfile() async {
    isLoading = true;
    update();
    try {
      final response = await EditProfileData().postData(
        userId: user.userId,
        phone: user.usersPhone ?? '',
        gender: user.usersGender ?? '',
        brithday: user.usersDateOfBirth ?? '',
        location: user.usersLocation ?? '',
        oldimagename:
            "2341photo_2025-03-11_09-25-27.jpg", // user.usersPhotoUrl!,
        files: [], //selectedImageFiles,
      );
      print("asdasdasdasdasdasdasdasd");
      print(response['status']);
      if (response['status'] == 'success') {
        isLoading = false;
        update();
        Get.snackbar(
          'Success',
          'Profile updated successfully.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to update profile.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // @override
  // editeAdditionalInfo() async {
  //   //make userInfoModel and DoctorInfoModel to get information and pass to EditAddionalInfoData().postData
  //   try {
  //     final response = await EditAddionalInfoData().postData(userId: userId, users_first_name: user.usersFirstName, users_last_name: user.usersLastName, interest_id: "1", adoption_preference: , looking_for_adoption: looking_for_adoption, adopted_before: adopted_before, preferred_age_range: preferred_age_range, has_experience_caring: has_experience_caring, oldimagename: oldimagename, files: files)
  //       // userId: user.userId,
  //       // phone: user.usersPhone ?? '',
  //       // gender: user.usersGender ?? '',
  //       // brithday: user.usersDateOfBirth ?? '',
  //       // location: user.usersLocation ?? '',
  //       // oldimagename:
  //       //     "7616photo_2025-03-11_09-25-27.jpg", // user.usersPhotoUrl!,
  //       // files: [], //selectedImageFiles,

  //     print("asdasdasdasdasdasdasdasd");
  //     print(response['status']);
  //     if (response['status'] == 'success') {
  //       Get.snackbar(
  //         'Success',
  //         'Profile updated successfully.',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white,
  //       );
  //     } else {
  //       Get.snackbar(
  //         'Error',
  //         'Failed to update profile.',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Something went wrong: $e',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }
}
