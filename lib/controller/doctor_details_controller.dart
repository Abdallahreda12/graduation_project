import 'package:get/get.dart';
import 'package:graduation_project/data/models/doctor_model.dart';

class DoctorDetailsController extends GetxController {
  late DoctorModel doctor;

  @override
  void onInit() {
    super.onInit();
    doctor = Get.arguments as DoctorModel;
    print(doctor);
  }
}
