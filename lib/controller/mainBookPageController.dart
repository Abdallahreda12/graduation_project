import 'package:get/get.dart';
import 'package:graduation_project/core/class/api.dart';
import 'package:graduation_project/data/models/doctor_model.dart';
import 'package:flutter/material.dart';
// import 'package:graduation_project/models/doctor_model.dart';

abstract class Mainbookpagecontroller extends GetxController {
  Future<void> fetchDoctors();
  void searchDoctors(String query);
  void clearSearch();
  Future<void> refreshDoctors();
}

class MainbookpagecontrollerImp extends Mainbookpagecontroller {
  // Lists
  List<DoctorModel> doctors = [];
  List<DoctorModel> filteredDoctors = [];

  // States
  bool isLoading = false;
  String errorMessage = '';

  // Search
  TextEditingController searchController = TextEditingController();

  // API URL
  final String apiUrl =
      'https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/book/view_doctors.php';

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  @override
  Future<void> fetchDoctors() async {
    try {
      isLoading = true;
      errorMessage = '';
      update();

      final res = await  Api().post(uri: apiUrl, body: {}) ;
        if (res['status'] == 'success') {
          final List<dynamic> doctorsData = res['data'];

          doctors = doctorsData
              .map((doctorJson) => DoctorModel.fromJson(doctorJson))
              .toList();
          //  doctors.add(DoctorModel(doctorId: 2,
          //   doctorsUserId: 2
          //   , doctorsSpecialization: "doctorsSpecialization"
          //   , doctorsDegree: "doctorsDegree"
          //   , doctorsYearsExperience: 20, 
          //   doctorsHomeVisit: 0, usersFirstName: "usersFirstName",
          //    usersPhotoUrl: "empty",
          //     usersLastName: "usersLastName",
          //      usersEmail: "usersEmail", 
          //      averageRating: "4.5",
          //       ratingCount: 50)) ;
           
          filteredDoctors = doctors;
       
      } else {
        errorMessage = 'Server error: ${res.statusCode}';
      }
    } catch (e) {
      errorMessage = 'Network error: ${e.toString()}';
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void searchDoctors(String query) {
    if (query.isEmpty) {
      filteredDoctors = doctors;
    } else {
      final q = query.toLowerCase();
      filteredDoctors = doctors.where((doctor) {
        final name =
            '${doctor.usersFirstName} ${doctor.usersLastName}'.toLowerCase();
        final spec = doctor.doctorsSpecialization.toLowerCase();
        return name.contains(q) || spec.contains(q);
      }).toList();
    }
    update();
  }

  @override
  void clearSearch() {
    searchController.clear();
    filteredDoctors = doctors;
    update();
  }

//   void gotoDoctorDetailsPage(int id) {
//   DoctorModel doctor = doctors.firstWhere((doc) => doc.doctorId == id);

//   Get.toNamed(
//     "/DoctorDetailsPage",
//     arguments: doctor,
//   );
// }

  @override
  Future<void> refreshDoctors() async {
    await fetchDoctors();
  }
}
