import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/locale/locale_controller.dart';
import 'package:graduation_project/locale/translation_service.dart';
import 'package:graduation_project/view/additional%20info%20edit%20page/AdditionalInfoEdit.dart';
import 'package:graduation_project/view/additional%20info%20page/AdditionalInfoPage.dart';
import 'package:graduation_project/view/adoption%20%20and%20help%20request%20page/adoptionAndHelpRequestPage.dart';
import 'package:graduation_project/view/adoption%20And%20Help%20Page/adoptionAndHelpPage.dart';
import 'package:graduation_project/view/adoption%20Details%20Page/adoptionDetailsPage.dart';
import 'package:graduation_project/view/bookPages/AnimalOwnerPage/AnimalOwnerPage.dart';
import 'package:graduation_project/view/bookPages/BookingPage/bookPage.dart';
import 'package:graduation_project/view/bookPages/DoctorDetailsPage/DoctorDetailsPage.dart';
import 'package:graduation_project/view/bookPages/mainBookPage/mainBookPage.dart';
import 'package:graduation_project/view/reset%20password%20page/create%20new%20password/createNewPasswordPage.dart';
import 'package:graduation_project/view/reset%20password%20page/email%20entry%20page/emailEntryPage.dart';
import 'package:graduation_project/view/help%20Details%20page/helpDetailsPage.dart';
import 'package:graduation_project/view/home%20page/homePage.dart';
import 'package:graduation_project/view/myRequestsPage/myRequestsPage.dart';
import 'package:graduation_project/view/notifaction%20page/notifactionPage.dart';
import 'package:graduation_project/view/onboarding%20page/onboardingPage.dart';
import 'package:graduation_project/view/reset%20password%20page/phone%20entry%20page/phoneEntryPage.dart';
import 'package:graduation_project/view/profile%20page/profilePage.dart';
import 'package:graduation_project/view/reset%20password%20page/resetPassword.dart';
import 'package:graduation_project/view/reset%20password%20page/verificationPage.dart';
import 'package:graduation_project/view/select%20lang%20page/selectLangPage.dart';
import 'package:graduation_project/view/signin%20page/signinPage.dart';
import 'package:graduation_project/view/signup%20completed%20page/signupCompletedPage.dart';
import 'package:graduation_project/view/signup%20page/signUpPage.dart';
import 'package:graduation_project/view/signup2%20page/signup2Page.dart';
import 'package:graduation_project/view/signup3%20page/signup3Page.dart';
import 'package:graduation_project/view/signup4%20page/signup4Page.dart';
import 'package:graduation_project/view/signup5%20page/signup5Page.dart';
import 'package:graduation_project/view/splash%20page/splashPage.dart';
import 'package:graduation_project/view/tips%20and%20tricks%20pages/TipsAndTricksPage/TipsAndTricksForYourPetsPage.dart';
import 'package:graduation_project/view/tips%20and%20tricks%20pages/information%20page/informationPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize controller
  final translations = await TranslationService.loadTranslations();
  final localeController = Get.put(MylocaleController());
  await localeController.initLang();
  runApp(MainApp(
    translations: translations,
    initialLocale: localeController.currentLocale.value,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp(
      {super.key, required this.translations, required this.initialLocale});
  final Map<String, Map<String, String>> translations;
  final Locale initialLocale;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      translations: TranslationService(translations),
      locale: initialLocale,
      fallbackLocale: TranslationService.fallbackLocale,
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
        GetPage(
            name: "/adoptiondetailspageWithDeleteButton",
            page: () => AdoptionDetailsPage(
                  enableDeleteButton: true,
                )),
        GetPage(
            name: "/helpdetailspageWithDeleteButton",
            page: () => HelpDetailsPage(  enableDeleteButton: true,)),
        GetPage(name: "/helpdetailspage", page: () => HelpDetailsPage()),
        GetPage(
            name: "/adoptionandhelprequestpage",
            page: () => AdoptionAndHelpRequestPage()),
        GetPage(name: "/notifactionpage", page: () => NotifactionPage()),
        GetPage(name: "/profilePage", page: () => ProfilePage()),
        GetPage(name: "/additionalinfopage", page: () => AdditionalInfoPage()),
        GetPage(
            name: "/additionalinfoeditpage",
            page: () => AdditionalInfoEditPage()),
        GetPage(name: "/resetpassword", page: () => ResetPassword()),
        GetPage(name: "/mainbookpage", page: () => MainBookPage()),
        GetPage(name: "/DoctorDetailsPage", page: () => DoctorDetailsPage()),
        GetPage(name: "/bookpage", page: () => BookingPage()),
        GetPage(name: "/animalownerpage", page: () => AnimalOwnerPage()),

        GetPage(name: "/emailentrypage", page: () => EmailEntryPage()),
        GetPage(name: "/phoneentrypage", page: () => PhoneEntryPage()),
        GetPage(name: "/verificationpage", page: () => VerificationPage()),
        GetPage(
            name: "/createnewpasswordpage",
            page: () => CreateNewPasswordPage()),

        GetPage(
            name: "/tipsandtricksforyourpetspage",
            page: () => TipsAndTricksForYourPetsPage()),
        GetPage(name: "/informationpage", page: () => InformationPage()),
        GetPage(name: "/myrequestspage", page: () => MyRequestsPage()),

      ],
    );
  }
}
