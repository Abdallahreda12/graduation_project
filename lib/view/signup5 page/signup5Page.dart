import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/Widgets/customCheckBoxList.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/buttonsRow.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';

class Signup5Page extends StatefulWidget {
  const Signup5Page({super.key, this.typeOfUser = ""});
  final String typeOfUser;
  @override
  State<Signup5Page> createState() => _Signup5PageState();
}

class _Signup5PageState extends State<Signup5Page> {
  //variables used in signup5 page for user
  late double usersliderValue = 23;
  late String userturnOnNotification;
  late String userLocation;
  ////////////////////////////////////////
  //variables used in signup5 page for doctor
  late double doctorSliderValue = 23;
  late String doctorturnOnNotification;
  late String doctorLocation;
  late String doctorHomeVisits;
  ////////////////////////////////////////
  /////variables used in signup5 page for institution
  late double institutionliderValue = 23;
  late String institutionLocation;
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        //
                        //Steps Row
                        //
                        StepsRow(currentIndex: 5),
                        const SizedBox(height: 25),
                        Text(
                          "Additional Information",
                          style: AppStyles.urbanistMedium22(context),
                        ),
                        const SizedBox(height: 25),
                        CustomTextField(
                          onDataChanged: (p0) {
                            setState(
                              () {
                                userLocation = p0;
                              },
                            );
                          },
                          text: "location",
                          hintText: "Where are you located? (City/ZIP Code)",
                          borderradius: 20,
                          validator: (value) {
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Radius",
                              style: AppStyles.urbanistMedium14(context),
                            ),
                            Text(
                              "How far are you willing to travel to adopt a pet or volunteer?",
                              style: AppStyles.urbanistReqular14(context)
                                  .copyWith(color: Colors.grey),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Slider(
                                activeColor: ColorsApp.primaryColor,
                                value: usersliderValue,
                                min: 0,
                                max: 200,
                                divisions: 100,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      usersliderValue = value;
                                    },
                                  );
                                },
                              ),
                            ),
                            Text(
                              "${usersliderValue.toInt().toString()} KM",
                              style: AppStyles.urbanistReqular16(context)
                                  .copyWith(color: ColorsApp.primaryColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomCheckListTile(
                          options: ["Yes", "No"],
                          question: "Turn on notification ",
                          onDataChanged: (p0) {
                            setState(
                              () {
                                userturnOnNotification = p0;
                              },
                            );
                          },
                        ),
                      ],
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            //
                            //Steps Row
                            //
                            StepsRow(currentIndex: 5),
                            const SizedBox(height: 25),
                            Text(
                              "Additional Information",
                              style: AppStyles.urbanistMedium22(context),
                            ),
                            const SizedBox(height: 25),
                            CustomTextField(
                              onDataChanged: (p0) {
                                setState(
                                  () {
                                    doctorLocation = p0;
                                  },
                                );
                              },
                              text: "location",
                              hintText:
                                  "Where are you located? (City/ZIP Code)",
                              borderradius: 20,
                              validator: (value) {
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Radius",
                                  style: AppStyles.urbanistMedium14(context),
                                ),
                                Text(
                                  "How far are you willing to travel to adopt a pet or volunteer?",
                                  style: AppStyles.urbanistReqular14(context)
                                      .copyWith(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Slider(
                                    activeColor: ColorsApp.primaryColor,
                                    value: doctorSliderValue,
                                    min: 0,
                                    max: 200,
                                    divisions: 100,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          doctorSliderValue = value;
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Text(
                                  "${doctorSliderValue.toInt().toString()} KM",
                                  style: AppStyles.urbanistReqular16(context)
                                      .copyWith(color: ColorsApp.primaryColor),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CustomCheckListTile(
                              options: ["Yes", "No"],
                              question: "Home Visits ",
                              onDataChanged: (p0) {
                                setState(
                                  () {
                                    doctorHomeVisits = p0;
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomCheckListTile(
                              options: ["Yes", "No"],
                              question: "Turn on notification ",
                              onDataChanged: (p0) {
                                setState(
                                  () {
                                    doctorturnOnNotification = p0;
                                  },
                                );
                              },
                            ),
                          ],
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            //
                            //Steps Row
                            //
                            StepsRow(currentIndex: 5),
                            const SizedBox(height: 25),
                            Text(
                              "Additional Information",
                              style: AppStyles.urbanistMedium22(context),
                            ),
                            const SizedBox(height: 25),
                            CustomTextField(
                              onDataChanged: (p0) {
                                setState(
                                  () {
                                    institutionLocation = p0;
                                  },
                                );
                              },
                              text: "location",
                              hintText:
                                  "Where are you located? (City/ZIP Code)",
                              borderradius: 20,
                              validator: (value) {
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Radius",
                                  style: AppStyles.urbanistMedium14(context),
                                ),
                                Text(
                                  "How far are you willing to travel to adopt a pet or volunteer?",
                                  style: AppStyles.urbanistReqular14(context)
                                      .copyWith(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Slider(
                                    activeColor: ColorsApp.primaryColor,
                                    value: institutionliderValue,
                                    min: 0,
                                    max: 200,
                                    divisions: 100,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          institutionliderValue = value;
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Text(
                                  "${doctorSliderValue.toInt().toString()} KM",
                                  style: AppStyles.urbanistReqular16(context)
                                      .copyWith(color: ColorsApp.primaryColor),
                                ),
                              ],
                            ),
                          ],
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
