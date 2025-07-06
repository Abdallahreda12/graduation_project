import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/loginController.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/customFunctions.dart';
import 'package:graduation_project/data/services/signupData.dart';

abstract class SignUpController extends GetxController {
  signupEmailAndPass();
  signupUserInfo();
  signupDoctorInfo();
  sendVerificationCode();
  pickImages();
  getLinkInCurrentLocation();
  openMap(context);
}

class SignUpControllerImp extends SignUpController {
  bool isLoading = false;

  late String gmail;
  late String pass;
  final GlobalKey<FormState> globalKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();

  //variables used in signup3 page for user
  final GlobalKey<FormState> userGlobalKey = GlobalKey();
  TextEditingController userDateofBirthController = TextEditingController();
  DateTime? userSelectedDate;
  late String userfirstName;
  late String userlastName;
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
  ///
  /// //variables used in signup5 page for user
  late double usersliderValue = 23;
  late String userturnOnNotification = "";
  late String userLocation = "";
  ////////////////////////////////////////
  //variables used in signup5 page for doctor
  late double doctorSliderValue = 23;
  late String doctorturnOnNotification = "";
  late String doctorLocation = "";
  late String doctorHomeVisits = "";
  ////////////////////////////////////////
  File? selectedImage;

  late String verfyCode = "";
  late int userId;

  TextEditingController locationController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    Get.delete<LoginControllerImp>();
  }

  //
  //
  @override
  signupDoctorInfo() async {
    isLoading = true;
    update();
    try {
      var res = await SignupData().postSignUpDoctorInfoData(
        userid: userId,
        usersFirstName: userfirstName,
        usersLastName: userlastName,
        phone: userPhoneNumber,
        gender: userSelectedGender!,
        birthday: userDateofBirthController.text,
        location: locationController.text,
        radius: "0",
        specialization: doctorSpecialization,
        degree: doctorDegrees,
        licensing_info: doctorLicensing,
        years_experience: doctorYearsExperience,
        hom_visit: doctorHomeVisits == "Yes" ? "1" : "0",
        selectedFiles: selectedImage != null ? [selectedImage!] : [],
      );
      print("Signup user info response: $res");

      if (res['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Your profile information has been submitted successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.toNamed("/signupcompletedpage");
      } else {
        Get.snackbar(
          'Failed',
          res['msg'] ?? 'Failed to complete signup.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorsApp.errorColor,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Signup user info error: $e");
      Get.snackbar(
        'Error',
        'Something went wrong while submitting your info.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    isLoading = false;
    update();
  }

  //
  //
  @override
  signupEmailAndPass() async {
    isLoading = true;
    update();
    try {
      var res = await SignupData()
          .postSignUpEmailAndPassData(email: gmail, password: pass);
      if (res != null && res['status'] == 'success') {
        isLoading = false;
        update();
        Get.snackbar(
          'Signup Successful',
          'Welcome! Your account has been created. Please complete your data.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.toNamed('/verifypage');
      } else {
        isLoading = false;
        update();
        Get.snackbar(
          'Error',
          'Account already exists.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorsApp.errorColor,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      isLoading = false;
      update();
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print(e);
    }
  }

  //
  //
  @override
  signupUserInfo() async {
    isLoading = true;
    update();
    try {
      var res = await SignupData().postSignUpUserInfoData(
        userid: userId,
        usersFirstName: userfirstName,
        usersLastName: userlastName,
        phone: userPhoneNumber,
        gender: userSelectedGender!,
        birthday: userDateofBirthController.text,
        location: locationController.text,
        radius: "0",
        adoptionPreference: animalsAdoptionPreferred,
        lookingForAdoption: lookingForAdoption == "Yes" ? "1" : "0", // from UI
        adoptedBefore: haveYouAdoptBefore == "Yes" ? "1" : "0", // from UI
        preferredAgeRange: animalsAdoptionPreferred, // from UI
        hasExperienceCaring:
            haveExperienceWithAnimalCare == "Yes" ? "1" : "0", // from UI
        selectedFiles: selectedImage != null ? [selectedImage!] : [],
      );
      print("Signup user info response: $res");

      if (res['status'] == 'success') {
        Get.snackbar(
          'Success',
          'Your profile information has been submitted successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.toNamed("/signupcompletedpage");
      } else {
        Get.snackbar(
          'Failed',
          res['msg'] ?? 'Failed to complete signup.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorsApp.errorColor,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Signup user info error: $e");
      Get.snackbar(
        'Error',
        'Something went wrong while submitting your info.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    isLoading = false;
    update();
  }

  //
  //
  Future<void> pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      selectedImage = File(result.files.single.path!);
      update();
    }
  }

  //
  //
  @override
  getLinkInCurrentLocation() async {
    isLoading = true;
    update();

    locationController.text = await CustomFunctions.getCurrentLocation();
    isLoading = false;
    update();
  }

  //
  //
  @override
  openMap(context) async {
    isLoading = true;
    update();
    CustomFunctions.openGoogleMaps(context);
    update();
    isLoading = false;
  }

  //
  //
  @override
  sendVerificationCode() async {
    print("📨 Verifying code: $verfyCode");
    isLoading = true;
    update();
    try {
      var res = await SignupData()
          .postVerificationCodeData(email: gmail, verfyCode: verfyCode);

      print("✅ Server Response: $res");

      if (res != null && res['status'] == 'success') {
        userId = res["user_id"];
        print(userId);
        isLoading = false;
        update();
        Get.snackbar(
          'Success',
          res['msg'] ?? 'Verification successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        verfyCode = '';
        Get.toNamed('/signup2page');
      } else {
        isLoading = false;
        update();
        Get.snackbar(
          'Failed',
          res?['msg'] ?? 'Invalid verification code.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        verfyCode = '';
      }
    } catch (e) {
      print("❌ Error during verification: $e");
      Get.snackbar(
        'Error',
        'Something went wrong.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
