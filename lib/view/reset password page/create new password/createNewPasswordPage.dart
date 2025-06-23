import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  Color iconPassColor = Colors.grey;
  Color iconConfirmPassColor = Colors.grey;

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
                'Create New Password',
                style: AppStyles.urbanistMedium22(context),
              ),
              const SizedBox(height: 7),
              Text(
                'Your new password must be different from previous password',
                style: AppStyles.urbanistReqular14(context),
              ),
              const SizedBox(height: 30),
              // New Password Field (matches your sign-in password field)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Password",
                    style: AppStyles.urbanistMedium14(context),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: iconPassColor == Colors.grey ? false : true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsApp.primaryColor),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                      hintText: "Strong Password Please",
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.visibility_off,
                          color: iconPassColor,
                        ),
                        onTap: () {
                          setState(() {
                            iconPassColor = iconPassColor == Colors.grey
                                ? Colors.red
                                : Colors.grey;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Confirm Password Field (same styling)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Confirm Password",
                    style: AppStyles.urbanistMedium14(context),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText:
                        iconConfirmPassColor == Colors.grey ? false : true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsApp.primaryColor),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                      hintText: "Confirm Your Password",
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.visibility_off,
                          color: iconConfirmPassColor,
                        ),
                        onTap: () {
                          setState(() {
                            iconConfirmPassColor =
                                iconConfirmPassColor == Colors.grey
                                    ? Colors.red
                                    : Colors.grey;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Custombutton(
                text: 'Confirm',
                width: double.infinity,
                onTap: () {
                  Get.toNamed("/signinpage");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
