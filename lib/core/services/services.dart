//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MyServices extends GetxService
{
  late SharedPreferences sharedPreferences ;
  Future<MyServices> intial () async
  {
   
    sharedPreferences =await SharedPreferences.getInstance();
     
    return this;
    
  }
  
  
}
 
 
intialService() async
{
  // Stripe.publishableKey = "stripePublishableKey";
  await Get.putAsync(() => MyServices().intial());
}