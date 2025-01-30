import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  //variables used in signup5 page for user
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
  /////variables used in signup5 page for institution
  late double institutionliderValue = 23;
  late String institutionLocation = "";
  /////////////////////////////////////////
  void updateData(String data) {
    setState(
      () {
        // userName = data;
      },
    );
  }

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
                      usersliderValue: usersliderValue,
                      onSliderChanged: (value) {
                        setState(() {
                          usersliderValue = value;
                        });
                      },
                      userLocation: userLocation,
                      onLocationChanged: (value) {
                        setState(() {
                          userLocation = value;
                        });
                      },
                      userturnOnNotification: userturnOnNotification,
                      onNotificationChanged: (value) {
                        setState(() {
                          userturnOnNotification = value;
                        });
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
                      secondButtonAction: () {
                        //if (userGlobalKey.currentState!.validate()) {
                        //}
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
        : widget.typeOfUser == "Doctor"
            ? Scaffold(
                resizeToAvoidBottomInset: true,
                body: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      SingleChildScrollView(
                        child: CustomSignUp5TextFieldDoctorColumn(
                          doctorSliderValue: doctorSliderValue,
                          onSliderChanged: (value) {
                            setState(() {
                              doctorSliderValue = value;
                            });
                          },
                          onLocationChanged: (value) {
                            setState(() {
                              doctorLocation = value;
                            });
                          },
                          onHomeVisitsChanged: (value) {
                            setState(() {
                              doctorHomeVisits = value;
                            });
                          },
                          onTurnOnNotificationChanged: (value) {
                            setState(() {
                              doctorturnOnNotification = value;
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
              )
            //
            //signup4 page for institution
            //
            : Scaffold(
                resizeToAvoidBottomInset: true,
                body: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      SingleChildScrollView(
                          child: CustomSignUp5TextFieldInstitutionColumn(
                        institutionSliderValue: institutionliderValue,
                        onSliderChanged: (value) {
                          setState(() {
                            institutionliderValue = value;
                          });
                        },
                        onLocationChanged: (value) {
                          setState(() {
                            institutionLocation = value;
                          });
                        },
                      )),
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
