import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find(); //علشان عاملين  put
  @override
  RouteSettings? redirect(String? route) {
    print(myServices.sharedPreferences.getString("step")) ;
    if (myServices.sharedPreferences.getString("step") == "1") {
        return RouteSettings(name: "/signinpage");
    }
    else {
      return const RouteSettings(name: "/homepage");
    } 
  }
}
