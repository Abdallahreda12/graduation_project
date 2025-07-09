import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/loginController.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/customFunctions.dart';
import 'package:graduation_project/data/models/doctorAdditionalInfoModel.dart';
import 'package:graduation_project/data/models/userInfoModel.dart';
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
  late String typrUser;
  bool isLoading = false;

  late String gmail;
  late String pass;
  final GlobalKey<FormState> globalKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();

  // Model instances
  UserInfoModel? userInfo;
  DoctorInfoModel? doctorInfo;

  // Form keys and controllers
  final GlobalKey<FormState> userGlobalKey = GlobalKey();
  final GlobalKey<FormState> doctorGlobalKey = GlobalKey();
  TextEditingController userDateofBirthController = TextEditingController();
  TextEditingController doctorDateofBirthController = TextEditingController();
  DateTime? userSelectedDate;
  DateTime? doctorSelectedDate;

  File? selectedImage;
  late String verfyCode = "";
  late int userId;
  TextEditingController locationController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    Get.delete<LoginControllerImp>();
    // Initialize models with default values
    _initializeModels();
  }

  void _initializeModels() {
    userInfo = UserInfoModel(
      firstName: '',
      lastName: '',
      gender: null,
      emailAddress: '',
      phoneNumber: '',
      birthday: '',
      ageRangeOfAnimal: '',
      lookingForAdoption: '',
      animalsAdoptionPreferred: '',
      haveYouAdoptBefore: '',
      haveExperienceWithAnimalCare: '',
      turnOnNotification: '',
      location: '',
      usersPhotoUrl: '',
    );

    doctorInfo = DoctorInfoModel(
      firstName: '',
      lastName: '',
      gender: null,
      emailAddress: '',
      phoneNumber: '',
      birthday: '',
      specialization: '',
      degrees: '',
      licensing: '',
      yearsExperience: '',
      clinicName: '',
      clinicAddress: '',
      turnOnNotification: '',
      location: '',
      homeVisits: '',
    );
  }

  // Helper methods to update model data
  void updateUserInfo({
    String? firstName,
    String? lastName,
    String? gender,
    String? emailAddress,
    String? phoneNumber,
    String? birthday,
    String? ageRangeOfAnimal,
    String? areYouHelper,
    String? lookingForAdoption,
    String? animalsAdoptionPreferred,
    String? haveYouAdoptBefore,
    String? haveExperienceWithAnimalCare,
    double? sliderValue,
    String? turnOnNotification,
    String? location,
  }) {
    userInfo = UserInfoModel(
      firstName: firstName ?? userInfo!.firstName,
      lastName: lastName ?? userInfo!.lastName,
      gender: gender ?? userInfo!.gender,
      emailAddress: emailAddress ?? userInfo!.emailAddress,
      phoneNumber: phoneNumber ?? userInfo!.phoneNumber,
      birthday: birthday ?? userInfo!.birthday,
      ageRangeOfAnimal: ageRangeOfAnimal ?? userInfo!.ageRangeOfAnimal,
      lookingForAdoption: lookingForAdoption ?? userInfo!.lookingForAdoption,
      animalsAdoptionPreferred:
          animalsAdoptionPreferred ?? userInfo!.animalsAdoptionPreferred,
      haveYouAdoptBefore: haveYouAdoptBefore ?? userInfo!.haveYouAdoptBefore,
      haveExperienceWithAnimalCare: haveExperienceWithAnimalCare ??
          userInfo!.haveExperienceWithAnimalCare,
      turnOnNotification: turnOnNotification ?? userInfo!.turnOnNotification,
      location: location ?? userInfo!.location,
      usersPhotoUrl: userInfo?.usersPhotoUrl,
    );
    update();
  }

  void updateDoctorInfo({
    String? firstName,
    String? lastName,
    String? gender,
    String? emailAddress,
    String? phoneNumber,
    String? birthday,
    String? specialization,
    String? degrees,
    String? licensing,
    String? yearsExperience,
    String? clinicName,
    String? clinicAddress,
    double? sliderValue,
    String? turnOnNotification,
    String? location,
    String? homeVisits,
  }) {
    doctorInfo = DoctorInfoModel(
      firstName: firstName ?? doctorInfo!.firstName,
      lastName: lastName ?? doctorInfo!.lastName,
      gender: gender ?? doctorInfo!.gender,
      emailAddress: emailAddress ?? doctorInfo!.emailAddress,
      phoneNumber: phoneNumber ?? doctorInfo!.phoneNumber,
      birthday: birthday ?? doctorInfo!.birthday,
      specialization: specialization ?? doctorInfo!.specialization,
      degrees: degrees ?? doctorInfo!.degrees,
      licensing: licensing ?? doctorInfo!.licensing,
      yearsExperience: yearsExperience ?? doctorInfo!.yearsExperience,
      clinicName: clinicName ?? doctorInfo!.clinicName,
      clinicAddress: clinicAddress ?? doctorInfo!.clinicAddress,
      turnOnNotification: turnOnNotification ?? doctorInfo!.turnOnNotification,
      location: location ?? doctorInfo!.location,
      homeVisits: homeVisits ?? doctorInfo!.homeVisits,
    );
    update();
  }

  @override
  signupDoctorInfo() async {
    isLoading = true;
    update();
    try {
      var res = await SignupData().postSignUpDoctorInfoData(
        userid: userId,
        usersFirstName: doctorInfo!.firstName!,
        usersLastName: doctorInfo!.lastName!,
        phone: doctorInfo!.phoneNumber!,
        gender: doctorInfo!.gender!,
        birthday: doctorDateofBirthController.text,
        location: locationController.text,
        radius: "0",
        specialization: doctorInfo!.specialization!,
        degree: doctorInfo!.degrees!,
        licensing_info: doctorInfo!.licensing!,
        years_experience: doctorInfo!.yearsExperience!,
        hom_visit: doctorInfo!.homeVisits == "Yes" ? "1" : "0",
        selectedFiles: selectedImage != null ? [selectedImage!] : [],
      );
      print("Signup doctor info response: $res");

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
      print("Signup doctor info error: $e");
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

  @override
  signupUserInfo() async {
    isLoading = true;
    update();
    try {
      var res = await SignupData().postSignUpUserInfoData(
        userid: userId,
        usersFirstName: userInfo!.firstName,
        usersLastName: userInfo!.lastName,
        phone: userInfo!.phoneNumber,
        gender: userInfo!.gender!,
        birthday: userDateofBirthController.text,
        location: locationController.text,
        radius: "0",
        adoptionPreference: userInfo!.animalsAdoptionPreferred,
        lookingForAdoption: userInfo!.lookingForAdoption == "Yes" ? "1" : "0",
        adoptedBefore: userInfo!.haveYouAdoptBefore == "Yes" ? "1" : "0",
        preferredAgeRange: userInfo!.ageRangeOfAnimal,
        hasExperienceCaring:
            userInfo!.haveExperienceWithAnimalCare == "Yes" ? "1" : "0",
        selectedFiles: selectedImage != null ? [selectedImage!] : [],
      );
      print("////////////////////////////////");
      print("Signup user info response: $res");
      print("////////////////////////////////");
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

  @override
  getLinkInCurrentLocation() async {
    isLoading = true;
    update();

    locationController.text = await CustomFunctions.getCurrentLocation();
    // Update both models with the current location
    updateUserInfo(location: locationController.text);
    updateDoctorInfo(location: locationController.text);

    isLoading = false;
    update();
  }

  @override
  openMap(context) async {
    isLoading = true;
    update();
    CustomFunctions.openGoogleMaps(context);
    update();
    isLoading = false;
  }

  @override
  sendVerificationCode() async {
    print("📨 Verifying code: $verfyCode");
    isLoading = true;
    update();
    try {
      var res = await SignupData()
          .postVerificationCodeData(email: gmail, verfyCode: verfyCode);
      print("///////////////////////////////////////////////////////////////");
      print("✅ Server Response: $res");
      print("///////////////////////////////////////////////////////////////");
      if (res != null && res['status'] == 'success') {
        userId = res["user_id"];
        print(
            "///////////////////////////////////////////////////////////////");
        print(userId);
        print(
            "///////////////////////////////////////////////////////////////");
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
