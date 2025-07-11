import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/controller/package_controller.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/core/util/class/api.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/data/models/clinic_model.dart';



class AnimalOwnerController extends GetxController {
  // Form controllers
  final fullNameController = TextEditingController();
  final animalTypeController = TextEditingController();
  final problemController = TextEditingController();
  final ageController = TextEditingController();
  
  // Form data
  String selectedGender = 'Unknown';
  bool isLoading = false;
  
  // Arguments from previous page
  Clinic? clinic;
  String? date;
  String? time;
  PackageModel? selectedPackage;
  MyServices myServices = Get.find();
    late int userId; 
  
  // API endpoint
  final String apiUrl = 'https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/book/add.php';
  
  @override
  void onInit() {
    super.onInit();
    // Get arguments from previous page
    if (Get.arguments != null) {
      clinic = Get.arguments['clinic'] as Clinic?;
      date = Get.arguments['date'] as String?;
      time = Get.arguments['time'] as String?;
      selectedPackage = Get.arguments['package'] as PackageModel?;
      userId =    myServices.sharedPreferences.getInt("id")! ;
    }
  }
  
  @override
  void onClose() {
    // Dispose controllers
    fullNameController.dispose();
    animalTypeController.dispose();
    problemController.dispose();
    ageController.dispose();
    super.onClose();
  }
  
  // Validate form
  bool validateForm() {
    if (fullNameController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your full name',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    
    
    if (animalTypeController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter animal type',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    if (ageController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter animal age',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    
    if (problemController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please describe the animal problem',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    
    return true;
  }
  
  // Submit booking
  Future<void> submitBooking() async {
    print(ageController.text) ;
    if (!validateForm()) return;
    
    try {
      isLoading = true;
      update() ;
      
      // Prepare data for API
      final Map<String, dynamic> bookingData = {
        'userid': userId.toString(), // Assuming you have a UserController
        'owner_name': fullNameController.text.trim(),
        'gender': selectedGender,
        'age':ageController.text.trim(),
        'problem': problemController.text.trim(),
        'clinic_id': clinic!.clinicId.toString(),
        'package_id': selectedPackage!.id.toString(),
        'date': date!,
        'time': time!,
      };
      
      print('Booking data: $bookingData'); // Debug print
      
      // Make API call
      final res = await Api().post(body: bookingData, uri: apiUrl) ;
      
 print(res) ;
      
     
        
        if (res['status'] == "success") {
          // Success - show dialog
          showSuccessDialog();
        } else {
          // API returned error
          Get.snackbar(
            'Error',
            res['msg'] ?? 'Failed to book appointment',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      
    } catch (e) {
      print('Error submitting booking: $e');
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading = false;
      update() ;

    }
  }
  
  // Show success dialog
void showSuccessDialog() {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Check Icon
            CircleAvatar(
              backgroundColor: ColorsApp.primaryColor,
              radius: 40,
              child: Icon(Icons.check, color: Colors.white, size: 40),
            ),
            SizedBox(height: 10),
            // Title
            Text(
              "Congratulations",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            // Subtitle
            Text(
              "Appointment successfully booked.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // View Appointment Button
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed("/myrequestspage");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsApp.primaryColor,
                minimumSize: Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "View Appointment",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

}