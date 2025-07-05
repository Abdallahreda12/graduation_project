import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/signUpController.dart';
import 'package:graduation_project/core/class/handleWidgets.dart';
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
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return GetBuilder<SignUpControllerImp>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: HandleLoadingIndicator(
          isLoading: controller.isLoading,
          widget: Padding(
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
                  globalKey: controller.globalKey,
                  emailController: controller.emailController,
                  onEmailChanged: (p0) async {
                    controller.gmail = p0;
                  },
                  onPasswordChanged: (p0) async {
                    controller.pass = p0;
                  },
                ),
                Expanded(child: SizedBox()),
                //
                //Buttons
                //
                ButtonsRow(
                  firstButton: "Back to Sign in",
                  secondButtonAction: () {
                    // if (controller.globalKey.currentState!.validate()) {
                    //   controller.signupEmailAndPass();
                    // }
                    Get.toNamed('/signup2page');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
