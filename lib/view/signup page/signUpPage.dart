import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/ButtonsRow.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late String gmail;
  late String name;
  late String pass;
  final GlobalKey<FormState> globalKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();

  Color iconPassColor = Colors.grey;
  Color iconGmailColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            StepsRow(),
            SizedBox(
              height: 25,
            ),
            Text(
              "Account Setup!",
              style: AppStyles.urbanistMedium22(context),
            ),
            SizedBox(
              height: 25,
            ),
            //
            //textFields
            //
            Form(
              key: globalKey,
              //
              //column contains all textfields
              //
              child: Column(
                children: [
                  //
                  //first textfield
                  //
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: AppStyles.urbanistMedium14(context),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(
                            () {
                              name = value;
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
                          hintText: "What’s your full name",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //
                  //Second Textfield
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
                  //
                  //third textfield
                  //
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: AppStyles.urbanistMedium14(context),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return "invaild Password";
                          } else {
                            setState(
                              () {
                                pass = value;
                              },
                            );
                          }
                          return null;
                        },
                        obscureText:
                            iconPassColor == Colors.grey ? false : true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorsApp.primaryColor),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                          ),
                          hintText: "Strong Password Please",
                          suffixIcon: GestureDetector(
                            child: Icon(
                              Icons.visibility_off,
                              color: iconPassColor,
                            ),
                            onTap: () {
                              iconPassColor == Colors.red
                                  ? iconPassColor = Colors.grey
                                  : iconPassColor = Colors.red;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            //
            //Buttons
            //
            ButtonsRow()
          ],
        ),
      ),
    );
  }
}
