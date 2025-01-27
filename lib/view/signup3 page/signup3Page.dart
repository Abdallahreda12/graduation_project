import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/buttonsRow.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';
import 'package:graduation_project/view/signup2%20page/widgets/typeUserBox.dart';
import 'package:intl/intl.dart';

class Signup3Page extends StatefulWidget {
  const Signup3Page({super.key, this.typeOfUser = ""});
  final String typeOfUser;
  @override
  State<Signup3Page> createState() => _Signup3PageState();
}

class _Signup3PageState extends State<Signup3Page> {
  //variables used in signup3 page for user
  final GlobalKey<FormState> userGlobalKey = GlobalKey();
  TextEditingController userDateofBirthController = TextEditingController();
  DateTime? userSelectedDate;
  late String userName;
  String? userSelectedGender;
  late String userEmailAddress;
  late String userPhoneNumber;
  ////////////////////////////////////////
  //variables used in signup3 page for doctor
  final GlobalKey<FormState> doctorGlobalKey = GlobalKey();
  TextEditingController doctorDateofBirthController = TextEditingController();
  DateTime? doctorSelectedDate;
  late String doctorName;
  String? doctorSelectedGender;
  late String doctorEmailAddress;
  late String doctorPhoneNumber;
  ////////////////////////////////////////
  /////variables used in signup3 page for institution
  final GlobalKey<FormState> institutionGlobalKey = GlobalKey();
  late String institutionName;
  late String institutionDescription;
  late String institutionRegistrationDetails;
  late String institutionWebsite;
  late String institutionFacebookLink;
  late String institutionEmailAddress;
  late String institutionPhoneNumber;
  /////////////////////////////////////////
  void updateData(String data) {
    setState(() {
      userName = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.typeOfUser == "User"
        //
        //signup3 page for user
        //
        ? Scaffold(
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    //
                    //Steps Row
                    //
                    StepsRow(currentIndex: 3),
                    const SizedBox(height: 25),
                    Text(
                      "Personal Information",
                      style: AppStyles.urbanistMedium22(context),
                    ),
                    const SizedBox(height: 25),
                    //
                    //Upload photo
                    //
                    Center(
                      child: Column(
                        children: [
                          // Avatar and Upload Button
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withAlpha(80),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: ColorsApp.primaryColor,
                              child: Image.asset(Assets.imagesAnonymousAvatar),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Profile Photo",
                            style: AppStyles.urbanistMedium22(context).copyWith(
                              color: Color(0xff004A5A),
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Custombutton(
                            text: "Upload Picture",
                            width: 180,
                            onTap: () {
                              // Handle upload action
                            },
                            borderradius: 50,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    //
                    // Form Fields
                    //
                    Form(
                      key: userGlobalKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            onDataChanged: (p0) {
                              userName = p0;
                            },
                            text: "Full Name",
                            hintText: "What is your full name",
                            borderradius: 20,
                            validator: (value) =>
                                value!.isEmpty ? "Name is required" : null,
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Date of Birth",
                                  style: AppStyles.urbanistReqular14(context)),
                              const SizedBox(height: 5),
                              TextFormField(
                                controller: userDateofBirthController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: "Date of birth",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: ColorsApp.primaryColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                  suffixIcon: Icon(Icons.calendar_today),
                                ),
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime.now(),
                                  );
                                  if (pickedDate != null) {
                                    setState(
                                      () {
                                        userSelectedDate = pickedDate;
                                        userDateofBirthController.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(userSelectedDate!);
                                      },
                                    );
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please select your date of birth";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Gender Dropdown
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gender",
                                style: AppStyles.urbanistMedium14(context),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                  hintText: "Select Gender",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: ColorsApp.primaryColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                ),
                                value: userSelectedGender,
                                items: ['Male', 'Female']
                                    .map((gender) => DropdownMenuItem(
                                          value: gender,
                                          child: Text(gender),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(
                                    () {
                                      userSelectedGender = value;
                                    },
                                  );
                                },
                                validator: (value) => value == null
                                    ? "Please select your gender"
                                    : null,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Email Field
                          CustomTextField(
                            onDataChanged: (value) {
                              setState(() {
                                userEmailAddress = value;
                              });
                            },
                            text: "Email Address",
                            hintText: "What’s your email address",
                            borderradius: 20,
                            validator: (value) => value!.contains('@')
                                ? null
                                : "Please enter a valid email",
                          ),
                          const SizedBox(height: 10),
                          // Phone Number Field
                          CustomTextField(
                            onDataChanged: (value) {
                              setState(() {
                                userPhoneNumber = value;
                              });
                            },
                            text: "Phone Number",
                            hintText: "What’s your phone number",
                            borderradius: 20,
                            validator: (value) => value!.length <= 11
                                ? "Please enter a valid phone number"
                                : null,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    //
                    // Buttons Row
                    //
                    ButtonsRow(
                      secondButtonAction: () {
                        //if (userGlobalKey.currentState!.validate()) {
                        //Get.toNamed("\")
                        //}
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        //
        //signup3 page for doctor
        //
        : widget.typeOfUser == "Doctor"
            ? Scaffold(
                resizeToAvoidBottomInset: true,
                body: Padding(
                  padding: const EdgeInsets.all(25),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        //
                        //Steps Row
                        //
                        StepsRow(currentIndex: 3),
                        const SizedBox(height: 25),
                        Text(
                          "Personal Information",
                          style: AppStyles.urbanistMedium22(context),
                        ),
                        const SizedBox(height: 25),
                        //
                        //Upload photo
                        //
                        Center(
                          child: Column(
                            children: [
                              // Avatar and Upload Button
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withAlpha(80),
                                      spreadRadius: 5,
                                      blurRadius: 5,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  backgroundColor: ColorsApp.primaryColor,
                                  child:
                                      Image.asset(Assets.imagesAnonymousAvatar),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Profile Photo",
                                style: AppStyles.urbanistMedium22(context)
                                    .copyWith(
                                  color: Color(0xff004A5A),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Custombutton(
                                text: "Upload Picture",
                                width: 180,
                                onTap: () {
                                  // Handle upload action
                                },
                                borderradius: 50,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        //
                        // Form Fields
                        //
                        Form(
                          key: doctorGlobalKey,
                          child: Column(
                            children: <Widget>[
                              CustomTextField(
                                onDataChanged: updateData,
                                text: "Full Name",
                                hintText: "What is your full name",
                                borderradius: 20,
                                validator: (value) =>
                                    value!.isEmpty ? "Name is required" : null,
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Date of Birth",
                                      style:
                                          AppStyles.urbanistReqular14(context)),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    controller: doctorDateofBirthController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: "Date of birth",
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            color: ColorsApp.primaryColor),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(width: 2),
                                      ),
                                      suffixIcon: Icon(Icons.calendar_today),
                                    ),
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime.now(),
                                      );
                                      if (pickedDate != null) {
                                        setState(
                                          () {
                                            doctorSelectedDate = pickedDate;
                                            doctorDateofBirthController.text =
                                                DateFormat('yyyy-MM-dd').format(
                                                    doctorSelectedDate!);
                                          },
                                        );
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please select your date of birth";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              // Gender Dropdown
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Gender",
                                    style: AppStyles.urbanistMedium14(context),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      hintText: "Select Gender",
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            color: ColorsApp.primaryColor),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(width: 2),
                                      ),
                                    ),
                                    value: doctorSelectedGender,
                                    items: ['Male', 'Female']
                                        .map((gender) => DropdownMenuItem(
                                              value: gender,
                                              child: Text(gender),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          doctorSelectedGender = value;
                                        },
                                      );
                                    },
                                    validator: (value) => value == null
                                        ? "Please select your gender"
                                        : null,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              // Email Field
                              CustomTextField(
                                onDataChanged: (value) {
                                  setState(() {
                                    doctorEmailAddress = value;
                                  });
                                },
                                text: "Email Address",
                                hintText: "What’s your email address",
                                borderradius: 20,
                                validator: (value) => value!.contains('@')
                                    ? null
                                    : "Please enter a valid email",
                              ),
                              const SizedBox(height: 10),
                              // Phone Number Field
                              CustomTextField(
                                onDataChanged: (value) {
                                  setState(() {
                                    doctorPhoneNumber = value;
                                  });
                                },
                                text: "Phone Number",
                                hintText: "What’s your phone number",
                                borderradius: 20,
                                validator: (value) => value!.length <= 11
                                    ? "Please enter a valid phone number"
                                    : null,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        //
                        // Buttons Row
                        //
                        ButtonsRow(
                          secondButtonAction: () {
                           // if (doctorGlobalKey.currentState!.validate()) {}
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            //
            //signup3 page for institution
            //
            : Scaffold(
                resizeToAvoidBottomInset: true,
                body: Padding(
                  padding: const EdgeInsets.all(25),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        //
                        //Steps Row
                        //
                        StepsRow(currentIndex: 3),
                        const SizedBox(height: 25),
                        Text(
                          "Institution Information",
                          style: AppStyles.urbanistMedium22(context),
                        ),
                        const SizedBox(height: 25),
                        //
                        // Form Fields
                        //
                        Form(
                          key: userGlobalKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                onDataChanged: (p0) {
                                  setState(() {
                                    institutionName = p0;
                                  });
                                },
                                text: "Name of Institution",
                                hintText: "What is your institution name",
                                borderradius: 20,
                                validator: (value) =>
                                    value!.isEmpty ? "Name is required" : null,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                onDataChanged: (p0) {
                                  //
                                  //if there is here logic error this is previos code
                                  // onDataChanged: updateData
                                  setState(() {
                                    institutionDescription = p0;
                                  });
                                },
                                text: "Description",
                                hintText:
                                    "Describe the purpose of the institution",
                                borderradius: 20,
                                validator: (value) => value!.isEmpty
                                    ? "required to provide summrization about institution"
                                    : null,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                onDataChanged: (p0) {
                                  setState(() {
                                    institutionRegistrationDetails = p0;
                                  });
                                },
                                text: "Registration Details",
                                hintText: "License or registration number",
                                borderradius: 20,
                                validator: (value) => value!.isEmpty
                                    ? "please provide your License number"
                                    : null,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                onDataChanged: (value) {},
                                text: "Email Address",
                                hintText: "What’s your email address",
                                borderradius: 20,
                                validator: (value) => value!.contains('@')
                                    ? null
                                    : "Please enter a valid email",
                              ),
                              const SizedBox(height: 10),
                              // Phone Number Field
                              CustomTextField(
                                onDataChanged: (value) {},
                                text: "Phone Number",
                                hintText: "What’s your phone number",
                                borderradius: 20,
                                validator: (value) => value!.length <= 11
                                    ? "Please enter a valid phone number"
                                    : null,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                onDataChanged: (p0) {
                                  setState(() {
                                    institutionWebsite = p0;
                                  });
                                },
                                text: "Website",
                                hintText: "Institution’s Website",
                                borderradius: 20,
                                validator: (value) {
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                onDataChanged: (p0) {
                                  setState(() {
                                    institutionFacebookLink = p0;
                                  });
                                },
                                text: "Facebook link",
                                hintText: "Institution’s faceBook link",
                                borderradius: 20,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        //
                        // Buttons Row
                        //
                        ButtonsRow(
                          secondButtonAction: () {
                           // if (userGlobalKey.currentState!.validate()) {}
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
}
