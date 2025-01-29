import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/ButtonsRow.dart';
import 'package:graduation_project/view/signup%20page/widgets/FormSignUpPage.dart';
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
            StepsRow(
              currentIndex: 1,
            ),
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
            FormSignUpPage(
              globalKey: globalKey,
              emailController: emailController,
              onNameChanged: (p0) {
                setState(() {
                  name = p0;
                });
              },
              onEmailChanged: (p0) {
                setState(() {
                  gmail = p0;
                });
              },
              onPasswordChanged: (p0) {
                setState(() {
                  pass = p0;
                });
              },
            ),
            Expanded(child: SizedBox()),
            //
            //Buttons
            //
            ButtonsRow(
              firstButton: "Back to Sign in",
              secondButtonAction: () {
                Get.toNamed('/signup2page');
              },
            )
          ],
        ),
      ),
    );
  }
}
