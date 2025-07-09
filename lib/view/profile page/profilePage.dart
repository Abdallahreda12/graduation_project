import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/profileController.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/class/handleWidgets.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/profile%20page/widgets/GenderTextFieldInProfilePage.dart';
import 'package:graduation_project/view/profile%20page/widgets/buildDropDownRow.dart';
import 'package:graduation_project/view/profile%20page/widgets/dateOfBirthTextFieldInProfilePage.dart';
import 'package:graduation_project/view/profile%20page/widgets/personCardInProfilePage.dart';
import 'package:graduation_project/view/profile%20page/widgets/PhoneNumberAndLocationTextField.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      body: Stack(children: [
        Positioned.fill(
          child: SvgPicture.asset(
            Assets.imagesLogoInverse,
            fit: BoxFit.none,
          ),
        ),
        GetBuilder<ProfileControllerImp>(
          builder: (controller) => HandleLoadingIndicator(
            isLoading: controller.isLoading,
            widget: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
              child: Column(
                children: [
                  //
                  //header of page
                  //
                  TextAndBackArrowHeader(
                      onTap: () {
                        Get.toNamed("/homepage");
                      },
                      texts: ["Profile"],
                      colorsOfTexts: [Colors.black]),
                  SizedBox(
                    height: 25,
                  ),
                  //
                  //profile card
                  //
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          PersonCardInProfilePage(
                            name:
                                '${controller.fullInfoForUser?.firstName} ${controller.fullInfoForUser?.lastName}',
                            image:
                                '$linkServerImage${controller.user.usersPhotoUrl}',
                            gmail: controller.user.usersEmail,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //
                          //textform fields for all textfileds
                          //
                          PhoneNumberAndLocationTextField(
                            onChanged: (value) {
                              controller.user.usersPhone = value;
                            },
                            initValue: controller.user.usersPhone,
                            label: "Phone Number",
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          DateOfBirthTextFieldInProfilePage(
                            initValue: controller.user.usersDateOfBirth,
                            label: "Date of Birth",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          PhoneNumberAndLocationTextField(
                            onChanged: (value) {
                              controller.user.usersLocation = value;
                            },
                            initValue: controller.user.usersLocation,
                            label: "Location",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GenderTextFieldInProfilePage(
                            label: 'Gender',
                            initValue: controller.user.usersGender,
                          ),
                          //
                          //
                          SizedBox(
                            height: 15,
                          ),
                          //
                          //theme and Lang options
                          //
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ColorsApp.primaryColorOpicaty),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: BuildDropdownRow(
                                    context: context,
                                    label: 'Theme',
                                    selectedValue: controller.selectedTheme,
                                    options: ['Light', 'Dark'],
                                    onChanged: (String? value) {
                                      controller.changeTheme(value);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: BuildDropdownRow(
                                    mainAxisAlign:
                                        MainAxisAlignment.spaceBetween,
                                    context: context,
                                    label: 'Language',
                                    selectedValue: controller.selectedLanguage,
                                    options: ['Eng', 'Arb'],
                                    onChanged: (String? value) {
                                      setState(() {
                                        controller.changeLang(value);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //
                          //last component in the page
                          //
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 20, 50, 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ColorsApp.primaryColorOpicaty),
                            child: Column(
                              children: [
                                // //
                                // //Settings
                                // //
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Row(
                                //       children: [
                                //         Icon(
                                //           Icons.settings,
                                //           size: 23,
                                //         ),
                                //         SizedBox(
                                //           width: 10,
                                //         ),
                                //         Text(
                                //           "Settings",
                                //           style: AppStyles.urbanistReqular14(
                                //               context),
                                //         )
                                //       ],
                                //     ),
                                //     GestureDetector(
                                //       onTap: () {},
                                //       child: Icon(
                                //         Icons.keyboard_arrow_right,
                                //         size: 28,
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 15,
                                // ),
                                //
                                //Additional Info
                                //
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.info,
                                          size: 23,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Additional Info",
                                          style: AppStyles.urbanistReqular14(
                                              context),
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.gotoAdditionalInfo();
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 28,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                //
                                //Notification
                                //
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.notifications,
                                          size: 23,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Notification",
                                          style: AppStyles.urbanistReqular14(
                                              context),
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          controller.notificationStatus ==
                                                  "Allow"
                                              ? controller.notificationStatus =
                                                  "Deny"
                                              : controller.notificationStatus =
                                                  "Allow";
                                        },
                                        child:
                                            Text(controller.notificationStatus))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                //
                                //Log out
                                //
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed("/signinpage");
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.logout_outlined,
                                            size: 23,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Log out",
                                            style: AppStyles.urbanistReqular14(
                                                context),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
