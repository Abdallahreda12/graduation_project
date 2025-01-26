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
  final GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController dateofBirthController = TextEditingController();
  DateTime? selectedDate;
  late String name;
  String? selectedGender;
  /////////////////////////////////////////
  ///
  void updateData(String data) {
    setState(() {
      name = data;
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
                      key: globalKey,
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
                                  style: AppStyles.urbanistReqular14(context)),
                              const SizedBox(height: 5),
                              TextFormField(
                                controller: dateofBirthController,
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
                                        selectedDate = pickedDate;
                                        dateofBirthController.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(selectedDate!);
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
                                value: selectedGender,
                                items: ['Male', 'Female']
                                    .map((gender) => DropdownMenuItem(
                                          value: gender,
                                          child: Text(gender),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(
                                    () {
                                      selectedGender = value;
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    //
                    // Buttons Row
                    //
                    ButtonsRow(
                      secondButtonAction: () {
                        if (globalKey.currentState!.validate()) {}
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
                resizeToAvoidBottomInset: false,
                body: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      //
                      //Count Steps
                      //
                      StepsRow(
                        currentIndex: 2,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "  you?",
                        style: AppStyles.urbanistMedium22(context),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      //
                      //content
                      //
                      Center(
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 32,
                          runSpacing: 32,
                          direction: Axis.horizontal,
                          children: [
                            TypeUserBox(
                              onDataChanged: updateData,
                              text: "User",
                              icon: Assets.imagesUser,
                            ),
                            TypeUserBox(
                              onDataChanged: updateData,
                              text: "Doctor",
                              icon: Assets.imagesDoctor,
                            ),
                            TypeUserBox(
                              onDataChanged: updateData,
                              text: "Institution",
                              icon: Assets.imagesInstitution,
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      //
                      //Buttons
                      //
                      ButtonsRow(
                        secondButtonAction: () {},
                      )
                    ],
                  ),
                ),
              )
            //
            //signup3 page for institution
            //
            : Scaffold(
                resizeToAvoidBottomInset: false,
                body: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      //
                      //Count Steps
                      //
                      StepsRow(
                        currentIndex: 2,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Who are you?",
                        style: AppStyles.urbanistMedium22(context),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      //
                      //content
                      //
                      Center(
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 32,
                          runSpacing: 32,
                          direction: Axis.horizontal,
                          children: [
                            TypeUserBox(
                              onDataChanged: updateData,
                              text: "User",
                              icon: Assets.imagesUser,
                            ),
                            TypeUserBox(
                              onDataChanged: updateData,
                              text: "Doctor",
                              icon: Assets.imagesDoctor,
                            ),
                            TypeUserBox(
                              onDataChanged: updateData,
                              text: "Institution",
                              icon: Assets.imagesInstitution,
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      //
                      //Buttons
                      //
                      ButtonsRow(
                        secondButtonAction: () {},
                      )
                    ],
                  ),
                ),
              );
  }
}
