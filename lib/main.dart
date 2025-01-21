import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/onboarding%20page/onboardingPage.dart';
import 'package:graduation_project/view/signin%20page/signinPage.dart';
import 'package:graduation_project/view/signup%20page/signUpPage.dart';
import 'package:graduation_project/view/signup2%20page/signup2Page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
      getPages: [
        GetPage(name: "/onboarding", page: () => OnboardingPage()),
        GetPage(name: "/signinpage", page: () => SigninPage()),
        GetPage(name: "/signuppage", page: () => SignupPage()),
        GetPage(name: "/signup2page", page: () => Signup2Page()),
      ],
    );
  }
}
