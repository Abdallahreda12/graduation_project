import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/signUpController.dart';
import 'package:graduation_project/core/util/appPreference.dart';
import 'package:graduation_project/view/signup%20page/widgets/buttonsRow.dart';
import 'package:graduation_project/view/signup5%20page/widgets/custom%20signup5%20textfield%20column/customSignUp5TextFieldDoctorColumn.dart';
import 'package:graduation_project/view/signup5%20page/widgets/custom%20signup5%20textfield%20column/customSignUp5TextFieldInstitutionColumn.dart';
import 'package:graduation_project/view/signup5%20page/widgets/custom%20signup5%20textfield%20column/customSignup5TextFieldUserColumn.dart';

class Signup5Page extends StatefulWidget {
  const Signup5Page({super.key, this.typeOfUser = ""});
  final String typeOfUser;
  @override
  State<Signup5Page> createState() => _Signup5PageState();
}

class _Signup5PageState extends State<Signup5Page> {
  final controller = Get.find<SignUpControllerImp>();

  @override
  Widget build(BuildContext context) {
    return widget.typeOfUser == "User"
        //
        //signup5 page for user
        //
        ? Scaffold(
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SingleChildScrollView(
                    child: CustomSignUp5TextFieldUserColumn(
                      userLocation: controller.locationController.text,
                      onLocationChanged: (value) {
                        controller.locationController.text = value;
                      },
                      userturnOnNotification: controller.userturnOnNotification,
                      onNotificationChanged: (value) {
                        setState(() {
                          controller.userturnOnNotification = value;
                        });
                        AppPreferences.setUserNotification(
                            value); // <-- Save to SharedPreferences
                      },
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
                      secondButtonAction: () async {
                        print("object");

                        await controller.signupUserInfo();
                        Get.toNamed("/signupcompletedpage");
                      },
                    ),
                  ),
                ],
              ),
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
                    child: CustomSignUp5TextFieldDoctorColumn(
                      doctorSliderValue: controller.doctorSliderValue,
                      onSliderChanged: (value) {
                        setState(() {
                          controller.doctorSliderValue = value;
                        });
                      },
                      onLocationChanged: (value) {
                        controller.locationController.text = value;
                      },
                      onHomeVisitsChanged: (value) {
                        setState(() {
                          controller.doctorHomeVisits = value;
                        });
                      },
                      onTurnOnNotificationChanged: (value) {
                        setState(() {
                          controller.doctorturnOnNotification = value;
                        });
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
                        //if (userGlobalKey.currentState!.validate()) {
                        //Get.toNamed("\")
                        //}
                        Get.toNamed("/signupcompletedpage");
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
