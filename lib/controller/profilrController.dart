import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/loginController.dart';
import 'package:graduation_project/data/models/userInfo.dart';
import 'package:graduation_project/locale/locale_controller.dart';
import 'package:graduation_project/theme/themeController.dart';

abstract class ProfileController extends GetxController {
  gotoAdditionalInfo();
  changeLang(value);
  changeTheme(value);
  showPopupMenu(context);
}

class ProfileControllerImp extends ProfileController {
  late int userId;
  late UserModel user;

  late ThemeController themeController;
  late MylocaleController langController;

  String selectedTheme = 'Light';
  String selectedLanguage = 'Eng';
  String notificationStatus = "Allow";

  IconData icon = Icons.edit_sharp;
  late TextEditingController textEditingController;
  DateTime? selectedDate;
  String selectedGender = 'None';
  @override
  void onInit() async {
    final LoginControllerImp loginController = Get.find();
    user = loginController.user;
    userId = user.userId;

    //themeController = Get.find<ThemeController>();
    langController = Get.find<MylocaleController>();

    String? savedLang = await langController.getSavedLanguage();
    selectedLanguage = (savedLang == 'ar') ? 'Arb' : 'Eng';

    //final isDark = themeController.isDarkMode.value;
    //selectedTheme = isDark ? 'Dark' : 'Light';

    update(); // Refresh UI

    super.onInit();
  }

  @override
  gotoAdditionalInfo() {
    Get.toNamed("/additionalinfopage");
  }

  @override
  changeLang(value) {
    selectedLanguage = value!;
    langController.changLang(value == "Eng" ? 'en' : 'ar');
    update();
  }

  @override
  changeTheme(value) {
    selectedTheme = value!;
    themeController.toggleTheme();
    update();
  }

  @override
  void showPopupMenu(context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final buttonPosition = button.localToGlobal(Offset.zero);
    final buttonSize = button.size;

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx + buttonSize.width, // Left position
        buttonPosition.dy + buttonSize.height, // Top position
        buttonPosition.dx, // Right position
        buttonPosition.dy + buttonSize.height, // Bottom
      ),
      items: [
        PopupMenuItem<String>(
          value: 'Male',
          child: Text('Male'),
        ),
        PopupMenuItem<String>(
          value: 'Female',
          child: Text('Female'),
        ),
      ],
    );

    if (selected != null) {
      selectedGender = selected;
      textEditingController = TextEditingController(text: selectedGender);
    }
  }
}
