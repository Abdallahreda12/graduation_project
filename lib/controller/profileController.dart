import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/loginController.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/data/models/doctorAdditionalInfoModel.dart';
import 'package:graduation_project/data/models/userInfo.dart';
import 'package:graduation_project/data/models/userInfoModel.dart';
import 'package:graduation_project/data/services/editAddionalIInfoData.dart';
import 'package:graduation_project/data/services/editProfileData.dart';
import 'package:graduation_project/data/services/viewAdditionalInfoData.dart';
import 'package:graduation_project/locale/locale_controller.dart';
import 'package:graduation_project/theme/themeController.dart';

abstract class ProfileController extends GetxController {
  gotoAdditionalInfo();
  changeLang(value);
  changeTheme(value);
  editProfile();
  showPopupMenu(context);
  viewAdditionalInfo();
  editeAdditionalInfo();
}

class ProfileControllerImp extends ProfileController {
  UserInfoModel? fullInfoForUser;
  DoctorInfoModel? additionalInfoForDoctor;

  bool isLoading = false;
  MyServices myServices = Get.find() ;

  late UserModel user;

  late ThemeController themeController;
  late MylocaleController langController;

  String selectedTheme = 'Light';
  String selectedLanguage = 'Eng';
  String notificationStatus = "Allow";

  IconData icon = Icons.edit_sharp;
  late TextEditingController textEditingController;
  TextEditingController textEditingControllerForFirstName =
      TextEditingController();
  TextEditingController textEditingControllerforLastName =
      TextEditingController();
  DateTime? selectedDate;
  String selectedGender = 'None';

  List<File> selectedImageFiles = [];

  @override
  void onInit() async {
    final LoginControllerImp loginController = Get.find();
    user = loginController.user;
    textEditingControllerForFirstName.text = user.usersFirstName!;
    textEditingControllerforLastName.text = user.usersLastName!;

    fullInfoForUser?.firstName = user.usersFirstName!;
    fullInfoForUser?.lastName = user.usersLastName!;
    fullInfoForUser?.birthday = user.usersDateOfBirth!;
    fullInfoForUser?.emailAddress = user.usersEmail!;
    fullInfoForUser?.gender = user.usersGender!;
    fullInfoForUser?.location = user.usersFullAddress!;
    fullInfoForUser?.phoneNumber = user.usersPhone!;

    await viewAdditionalInfo();

    //themeController = Get.find<ThemeController>();
    langController = Get.find<MylocaleController>();

    String? savedLang = await langController.getSavedLanguage();
    selectedLanguage = (savedLang == 'ar') ? 'Arb' : 'Eng';

    //final isDark = themeController.isDarkMode.value;
    //selectedTheme = isDark ? 'Dark' : 'Light';

    update();

    super.onInit();
  }

  //
  //
  Future<void> pickImages() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      selectedImageFiles = [File(result.files.single.path!)];
      update();
    }
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
      var response = await EditProfileData().postData(
        userId: user.userId,
        phone: user.usersPhone ?? '',
        gender: user.usersGender ?? '',
        brithday: user.usersDateOfBirth ?? '',
        location: user.usersLocation ?? '',
      );
      //السطر العاق ده بيطلع ايرور
      //response["status"];
      isLoading = false;
      update();
      // if (response['status'] == 'success') {
      //   isLoading = false;
      //   update();
      //   Get.snackbar(
      //     'Success',
      //     'Profile updated successfully.',
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.green,
      //     colorText: Colors.white,
      //   );
      // } else {
      //   Get.snackbar(
      //     'Error',
      //     'Failed to update profile.',
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.red,
      //     colorText: Colors.white,
      //   );
      // }
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

//
//
  @override
  viewAdditionalInfo() async {
    try {
      var response =
          await ViewAddionalInfoData().postDataForUser(userId: user.userId);
      update();
      print("✅sssssssss Response: $response");
      if (response['status'] == 'success') {
        final userInfoMap = response['data'][0];
        print(
            "aaaaaaaassss${userInfoMap["user_interests_looking_for_adoption"].toString()}");
        fullInfoForUser = UserInfoModel.fromJson({
          "first_name": user.usersFirstName ?? '',
          "last_name": user.usersLastName ?? '',
          "gender": user.usersGender,
          "email_address": user.usersEmail ?? '',
          "phone_number": user.usersPhone ?? '',
          "birthday": user.usersDateOfBirth ?? '',
          "age_range_of_animal":
              userInfoMap["user_interests_preferred_age_range"] ?? '',
          "are_you_helper": "",
          "looking_for_adoption":
              userInfoMap["user_interests_looking_for_adoption"].toString(),
          "animals_adoption_preferred":
              userInfoMap["user_interests_adoption_preference"] ?? '',
          "have_you_adopt_before":
              userInfoMap["user_interests_adopted_before"].toString(),
          "have_experience_with_animal_care":
              userInfoMap["user_interests_has_experience_caring"].toString(),
          "turn_on_notification": "",
          "location": user.usersFullAddress ?? '',
          "users_photo_url": user.usersPhotoUrl ?? '',
        });
      }
      update();
    } catch (e) {
      print("❌ Exception in viewAdditionalInfo: $e");
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

//
//view based on user.type, if user show user's data if doctor show doctor's data
  @override
  editeAdditionalInfo() async {
    print("1");
    if (true) {
      print("2");
      //user.type == "user") {
      try {
        print("3");
        print(fullInfoForUser!.firstName);
        print(fullInfoForUser!.lastName);
        print(fullInfoForUser!.animalsAdoptionPreferred);
        print(fullInfoForUser!.lookingForAdoption);
        print(fullInfoForUser!.haveYouAdoptBefore);
        print(fullInfoForUser!.ageRangeOfAnimal);
        print(fullInfoForUser!.haveExperienceWithAnimalCare);
        print(fullInfoForUser!.usersPhotoUrl.toString());
        print(selectedImageFiles);
        update();
        var response = await EditAddionalInfoData().postDataForUser(
            userId: user.userId,
            users_first_name: textEditingControllerForFirstName.text,
            users_last_name: textEditingControllerforLastName.text,
            adoption_preference:
                fullInfoForUser?.animalsAdoptionPreferred ?? "",
            looking_for_adoption: fullInfoForUser?.lookingForAdoption ?? "",
            adopted_before: fullInfoForUser?.haveYouAdoptBefore ?? "",
            preferred_age_range: fullInfoForUser?.ageRangeOfAnimal ?? "",
            has_experience_caring:
                fullInfoForUser?.haveExperienceWithAnimalCare ?? "",
            oldimagename: fullInfoForUser?.usersPhotoUrl.toString() ?? "",
            files: selectedImageFiles);
        update();
        viewAdditionalInfo();
        update();
        if (response['status'] == 'success') {
          user.usersFirstName = textEditingControllerForFirstName.text;
          user.usersLastName = textEditingControllerforLastName.text;
          print("5");
          Get.snackbar(
            'Success',
            'Profile updated successfully.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          update();
        } else {
          Get.snackbar(
            'Error',
            'Failed to update profile.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
        update();
      } catch (e) {
        print(user.userId);
        print(e);
        Get.snackbar(
          'Error',
          'Something wenssssssssssssst wrong: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        update();
      }
    }
  }
}
