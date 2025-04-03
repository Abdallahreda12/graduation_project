import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
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
  String _selectedTheme = 'Light';
  String _selectedLanguage = 'Eng';
  String notificationStatus = "Allow";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
        child: Column(
          children: [
            //
            //header of page
            //
            TextAndBackArrowHeader(
                texts: ["Profile"], colorsOfTexts: [Colors.black]),
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
                      name: "Abdallah Reda",
                      image: Assets.imagesProfilePhoto,
                      gmail: "Abdallah@gmail.com",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //
                    //textform fields for all textfileds
                    //
                    PhoneNumberAndLocationTextField(
                      initValue: "+201114499955",
                      label: "Phone Number",
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DateOfBirthTextFieldInProfilePage(
                      initValue: "11/6/2003",
                      label: "Date of Birth",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    PhoneNumberAndLocationTextField(
                      initValue: "Egypt",
                      label: "Location",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GenderTextFieldInProfilePage(
                      label: 'Gender',
                      initValue: 'Male',
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
                          BuildDropdownRow(
                            context: context,
                            label: 'Theme',
                            selectedValue: _selectedTheme,
                            options: ['Light', 'Dark'],
                            onChanged: (String? value) {
                              setState(() {
                                _selectedTheme = value!;
                              });
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          BuildDropdownRow(
                            context: context,
                            label: 'Language',
                            selectedValue: _selectedLanguage,
                            options: ['Eng', 'Arb'],
                            onChanged: (String? value) {
                              setState(() {
                                _selectedLanguage = value!;
                              });
                            },
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
                          //
                          //Settings
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    size: 23,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Settings",
                                    style: AppStyles.urbanistReqular14(context),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
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
                          //Additional Info
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    style: AppStyles.urbanistReqular14(context),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    style: AppStyles.urbanistReqular14(context),
                                  )
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      notificationStatus == "Allow"
                                          ? notificationStatus = "Deny"
                                          : notificationStatus = "Allow";
                                    });
                                  },
                                  child: Text(notificationStatus))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //
                          //Log out
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      style:
                                          AppStyles.urbanistReqular14(context),
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
    );
  }
}
