import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/data/models/userInfo.dart';
import 'package:graduation_project/data/services/loginData.dart';

abstract class LoginController extends GetxController {
  login(context);
  gotosignup();
  showPassword();
  validateEmail(String? value);
  validatePass(String? value);
  autoCompleteGmail();
  goToResetPass();
  adduser();
}

class LoginControllerImp extends LoginController {
  bool isLoading = false;
  final GlobalKey<FormState> globalKey = GlobalKey();
  late String email;
  late String pass;
  late UserModel user;
  Color iconPassColor = Colors.red;
  Color iconGmailColor = Colors.grey;
  final TextEditingController emailController = TextEditingController();

   MyServices myServices = Get.find(); 

  @override
  login(context) async {
    if (globalKey.currentState!.validate()) {
      isLoading = true;
      update();
      var res = await LoginData().postData(email: email, password: pass);
      if (res['status'] == 'success') {
        user = UserModel.fromJson(res['data'][0]);
        isLoading = false;
        update();

        myServices.sharedPreferences.setString("step" ,"3");
        myServices.sharedPreferences.setString("name" ,user.usersFirstName!);
        myServices.sharedPreferences.setInt("id" ,user.userId);
        myServices.sharedPreferences.setString("email" ,user.usersEmail!);
        myServices.sharedPreferences.setString("location" ,user.usersLocation!);
        print(res['data'][0]) ;
        if(user.type == 0 ){ ///////////user  //////////////////
            Get.toNamed("/homepage");
        }else{
            Get.toNamed("/homepage");
        }
      
      } else {
        isLoading = false;
        Get.snackbar(
          "",
          "",
          titleText: Text(
            "Login Failed",
            style: AppStyles.urbanistMedium16(context)
                .copyWith(color: Colors.white),
          ),
          messageText: Text(
            "Invalid username or password",
            style: AppStyles.urbanistReqular14(context)
                .copyWith(color: Colors.white),
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorsApp.errorColor,
          margin: const EdgeInsets.all(12),
          duration: const Duration(seconds: 3),
        );
      }
      // user = UserModel.fromJson(res['data'][0]);
      // print(user.usersEmail);
    }
    update();
  }

  @override
  gotosignup() {
    Get.toNamed("/signuppage");
  }

  @override
  showPassword() {
    iconPassColor == Colors.red
        ? iconPassColor = Colors.grey
        : iconPassColor = Colors.red;
    update();
  }

  @override
  validateEmail(String? value) {
    bool validGmail =
        RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(value!);
    if (value.isEmpty || validGmail == false) {
      return "invaild Email";
    }
    return null;
  }

  @override
  autoCompleteGmail() {
    if (iconGmailColor == Colors.grey) {
      iconGmailColor = ColorsApp.primaryColor;
      emailController.text = "@gmail.com";
    } else {
      iconGmailColor = Colors.grey;
      emailController.text = "";
    }
    update();
  }

//edite this validator
  @override
  validatePass(String? value) {
    if (value!.isEmpty || value.length < 3) {
      return "invaild Password";
    }
    return null;
  }

  @override
  goToResetPass() {
    Get.toNamed("/resetpassword");
  }

  @override
  adduser() {}
}
