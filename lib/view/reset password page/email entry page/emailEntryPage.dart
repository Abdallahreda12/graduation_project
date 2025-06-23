import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class EmailEntryPage extends StatefulWidget {
  const EmailEntryPage({super.key});

  @override
  State<EmailEntryPage> createState() => _EmailEntryPageState();
}

class _EmailEntryPageState extends State<EmailEntryPage> {
  late String gmail;
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();

  Color iconGmailColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset Via Email',
                style: AppStyles.urbanistMedium22(context),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Please please enter the email address',
                style: AppStyles.urbanistReqular14(context),
              ),
              SizedBox(
                height: 45,
              ),
              Form(
                key: globalKey,
                //
                //column contains all textfields
                //
                child: Column(
                  children: [
                    //
                    //textfield
                    //
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: AppStyles.urbanistMedium14(context),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            bool validGmail =
                                RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                                    .hasMatch(value!);
                            if (value.isEmpty || validGmail == false) {
                              return "invaild Email";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(
                              () {
                                gmail = value;
                              },
                            );
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsApp.primaryColor),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                            ),
                            hintText: "YourGmail@gmail.com",
                            suffixIcon: GestureDetector(
                              child: Icon(
                                Icons.alternate_email_sharp,
                                color: iconGmailColor,
                              ),
                              onTap: () {
                                setState(
                                  () {
                                    if (iconGmailColor == Colors.grey) {
                                      iconGmailColor = ColorsApp.primaryColor;
                                      emailController.text = "@gmail.com";
                                    } else {
                                      iconGmailColor = Colors.grey;
                                      emailController.text = "";
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Custombutton(
                text: 'Next',
                width: double.infinity,
                onTap: () {
                  Get.toNamed("/verificationpage");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
