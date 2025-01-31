import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signin%20page/widgets/headerpage.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  late String gmail;
  late String pass;
  final GlobalKey<FormState> globalKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();

  Color iconPassColor = Colors.grey;
  Color iconGmailColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //
          //Header of the page
          //
          HeaderSignInpage(),
          //
          //textfield and button
          //
          Positioned(
            top: 350,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    //
                    //form
                    //
                    child: Form(
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
                                    borderSide: BorderSide(
                                        color: ColorsApp.primaryColor),
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
                                            iconGmailColor =
                                                ColorsApp.primaryColor;
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
                          //second textfield
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
                                    borderSide: BorderSide(
                                        color: ColorsApp.primaryColor),
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
                          //
                          //forget pass
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Forgot Password?",
                                  style: AppStyles.urbanistReqular14(context),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //
                  //button + Sign Up
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    //
                    //column containes all items
                    //
                    child: Column(
                      children: [
                        Custombutton(
                          text: "Sign In",
                          width: MediaQuery.of(context).size.width,
                          onTap: () {
                            Get.toNamed("/homepage");
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "you don’t have any account?",
                              style: AppStyles.urbanistReqular14(context),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/signuppage");
                              },
                              child: Text(
                                "sign up now",
                                style: AppStyles.urbanistMedium14(context)
                                    .copyWith(color: ColorsApp.primaryColor),
                              ),
                            )
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
    );
  }
}
