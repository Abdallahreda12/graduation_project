import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/signUpController.dart';
import 'package:graduation_project/core/class/handleWidgets.dart';
import 'package:graduation_project/core/util/appPreference.dart';
import 'package:graduation_project/view/signup%20page/widgets/buttonsRow.dart';
import 'package:graduation_project/view/signup5%20page/widgets/custom%20signup5%20textfield%20column/customSignUp5TextFieldDoctorColumn.dart';
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
            body: HandleLoadingIndicator(
              isLoading: controller.isLoading,
              widget: Padding(
                padding: const EdgeInsets.all(25),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: CustomSignUp5TextFieldUserColumn(
                        onLocationChanged: (value) {
                          controller.locationController.text = value;
                          // Update the user model with the new location
                          controller.updateUserInfo(location: value);
                        },
                        onNotificationChanged: (value) {
                          // Update the user model with notification preference
                          controller.updateUserInfo(turnOnNotification: value);
                          AppPreferences.setUserNotification(value);
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
                          await controller.signupUserInfo();
                          //Get.toNamed("/signupcompletedpage");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        //
        //signup5 page for doctor
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
                      child: CustomSignUp5TextFieldDoctorColumn(
                        onLocationChanged: (value) {
                          controller.locationController.text = value;
                          // Update the doctor model with the new location
                          controller.updateDoctorInfo(location: value);
                        },
                        onHomeVisitsChanged: (value) {
                          // Update the doctor model with home visits preference
                          controller.updateDoctorInfo(homeVisits: value);
                        },
                        onTurnOnNotificationChanged: (value) {
                          // Update the doctor model with notification preference
                          controller.updateDoctorInfo(
                              turnOnNotification: value);
                          AppPreferences.setUserNotification(value);
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
                        secondButtonAction: () async {
                          // Optional: Add validation here if needed
                          // if (controller.doctorGlobalKey.currentState!.validate()) {
                          await controller.signupDoctorInfo();
                          // }
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
