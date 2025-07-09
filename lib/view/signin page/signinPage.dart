import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/loginController.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/class/handleWidgets.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signin%20page/widgets/headerpage.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      body: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandleLoadingIndicator(
                isLoading: controller.isLoading,
                widget: Stack(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              //
                              //form
                              //
                              child: Form(
                                key: controller.globalKey,
                                //
                                //column contains all textfields
                                //
                                child: Column(
                                  children: [
                                    //
                                    //first textfield
                                    //
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Email",
                                          style: AppStyles.urbanistMedium14(
                                              context),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller:
                                              controller.emailController,
                                          validator: (value) {
                                            return controller
                                                .validateEmail(value);
                                          },
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                controller.email = value;
                                              },
                                            );
                                          },
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      ColorsApp.primaryColor),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 2),
                                            ),
                                            hintText: "YourGmail@gmail.com",
                                            suffixIcon: GestureDetector(
                                              child: Icon(
                                                Icons.alternate_email_sharp,
                                                color:
                                                    controller.iconGmailColor,
                                              ),
                                              onTap: () {
                                                controller.autoCompleteGmail();
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Password",
                                          style: AppStyles.urbanistMedium14(
                                              context),
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          validator: (value) {
                                            return controller
                                                .validatePass(value);
                                          },
                                          onChanged: (value) {
                                            controller.pass = value;
                                          },
                                          obscureText:
                                              controller.iconPassColor ==
                                                      Colors.grey
                                                  ? false
                                                  : true,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      ColorsApp.primaryColor),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 2),
                                            ),
                                            hintText: "Strong Password Please",
                                            suffixIcon: GestureDetector(
                                              child: Icon(
                                                Icons.visibility_off,
                                                color: controller.iconPassColor,
                                              ),
                                              onTap: () {
                                                controller.showPassword();
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
                                          onTap: () {
                                            controller.goToResetPass();
                                          },
                                          child: Text(
                                            "Forgot Password?",
                                            style: AppStyles.urbanistReqular14(
                                                context),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              //
                              //column containes all items
                              //
                              child: Column(
                                children: [
                                  Custombutton(
                                    text: "Sign In",
                                    width: MediaQuery.of(context).size.width,
                                    onTap: () {
                                      controller.login(context);
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
                                        style: AppStyles.urbanistReqular14(
                                            context),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.gotosignup();
                                        },
                                        child: Text(
                                          "sign up now",
                                          style: AppStyles.urbanistMedium14(
                                                  context)
                                              .copyWith(
                                                  color:
                                                      ColorsApp.primaryColor),
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
              )),
    );
  }
}
