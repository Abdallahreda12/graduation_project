import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/adoption%20And%20Help%20Page/adoptionAndHelpPage.dart';
import 'package:graduation_project/view/adoption%20Details%20Page/adoptionDetailsPage.dart';
import 'package:graduation_project/view/home%20page/homePage.dart';
import 'package:graduation_project/view/onboarding%20page/onboardingPage.dart';
import 'package:graduation_project/view/select%20lang%20page/selectLangPage.dart';
import 'package:graduation_project/view/signin%20page/signinPage.dart';
import 'package:graduation_project/view/signup%20completed%20page/signupCompletedPage.dart';
import 'package:graduation_project/view/signup%20page/signUpPage.dart';
import 'package:graduation_project/view/signup2%20page/signup2Page.dart';
import 'package:graduation_project/view/signup3%20page/signup3Page.dart';
import 'package:graduation_project/view/signup4%20page/signup4Page.dart';
import 'package:graduation_project/view/signup5%20page/signup5Page.dart';
import 'package:graduation_project/view/splash%20page/splashPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      getPages: [
        GetPage(name: "/splashpage", page: () => SplashPage()),
        GetPage(name: "/selectlangpage", page: () => SelectLangPage()),
        GetPage(name: "/onboarding", page: () => OnboardingPage()),
        GetPage(name: "/signinpage", page: () => SigninPage()),
        GetPage(name: "/signuppage", page: () => SignupPage()),
        GetPage(name: "/signup2page", page: () => Signup2Page()),
        GetPage(
            name: "/signup3userpage",
            page: () => Signup3Page(
                  typeOfUser: 'User',
                )),
        GetPage(
            name: "/signup3doctorpage",
            page: () => Signup3Page(
                  typeOfUser: 'Doctor',
                )),
        GetPage(
            name: "/signup3institutionpage",
            page: () => Signup3Page(
                  typeOfUser: 'Institution',
                )),
        GetPage(
            name: "/signup4userpage",
            page: () => Signup4Page(
                  typeOfUser: 'User',
                )),
        GetPage(
            name: "/signup4doctorpage",
            page: () => Signup4Page(
                  typeOfUser: 'Doctor',
                )),
        GetPage(
            name: "/signup4institutionpage",
            page: () => Signup4Page(
                  typeOfUser: 'Institution',
                )),
        GetPage(
            name: "/signup5userpage",
            page: () => Signup5Page(
                  typeOfUser: 'User',
                )),
        GetPage(
            name: "/signup5doctorpage",
            page: () => Signup5Page(
                  typeOfUser: 'Doctor',
                )),
        GetPage(
            name: "/signup5institutionpage",
            page: () => Signup5Page(
                  typeOfUser: 'Institution',
                )),
        GetPage(
            name: "/signupcompletedpage", page: () => SignupCompletedPage()),
        GetPage(name: "/homepage", page: () => HomePage()),
        GetPage(name: "/adoptionandhelp", page: () => AdoptionAndHelpPage()),
        GetPage(
            name: "/adoptiondetailspage", page: () => AdoptionDetailsPage()),
      ],
    );
  }
}
