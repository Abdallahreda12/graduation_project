import 'package:get/get.dart';
import 'package:graduation_project/core/class/api.dart';
import 'package:graduation_project/data/models/clinic_model.dart';
import 'package:flutter/material.dart';

class PackageController extends GetxController {
  List<PackageModel> packages = [];
  int? selectedPackageIndex;
  PackageModel? selectedPackage;
  bool isLoading = false;

  // Arguments from previous page
  Clinic? clinic;
  String? date;
  String? time;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments != null) {
      clinic = arguments['clinic'];
      date = arguments['date'];
      time = arguments['time'];
    }
    fetchPackages();
  }

  Future<void> fetchPackages() async {
    if (clinic == null) return;

    try {
      isLoading = true;
      update();

      final data = await Api().post(
        uri: 'https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/book/view_packages.php',
        body: {"clinic_id": clinic!.clinicId.toString()},
      );

      if (data['status'] == 'success') {
        packages = _parsePackages(data['data']);
      } else {
        packages = [];
      }
    } catch (e) {
      print('Error fetching packages: $e');
      packages = [];
    } finally {
      isLoading = false;
      update();
    }
  }

  List<PackageModel> _parsePackages(List<dynamic> data) {
    return data.map((json) => PackageModel.fromJson(json, clinic!.name)).toList();
  }

  void selectPackage(int index) {
    selectedPackageIndex = index;
    selectedPackage = packages[index];
    update();
  }

  // Get communication types for display
  List<CommunicationType> getCommunicationTypes() {
    return CommunicationTypes.getCommunicationTypes();
  }

  // Get communication type by ID
  CommunicationType? getCommunicationTypeById(int id) {
    return CommunicationTypes.getById(id);
  }
}

// Communication Type Model
class CommunicationType {
  final int id;
  final String name;
  final String description;
  final IconData icon;

  CommunicationType({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
  });
}

// Static Communication Types List
class CommunicationTypes {
  static List<CommunicationType> getCommunicationTypes() {
    return [
      CommunicationType(
        id: 1,
        name: "Messaging",
        description: "Chat with doctor",
        icon: Icons.message_outlined,
      ),
      CommunicationType(
        id: 2,
        name: "Voice Call",
        description: "Voice call with doctor",
        icon: Icons.phone_outlined,
      ),
      CommunicationType(
        id: 3,
        name: "Video Call",
        description: "Video call with doctor",
        icon: Icons.videocam_outlined,
      ),
      CommunicationType(
        id: 4,
        name: "Visit Clinic",
        description: "Visit doctor clinic",
        icon: Icons.local_hospital_outlined,
      ),
    ];
  }

  static CommunicationType? getById(int id) {
    try {
      return getCommunicationTypes().firstWhere((type) => type.id == id);
    } catch (e) {
      return null;
    }
  }

  static CommunicationType? getByName(String name) {
    try {
      return getCommunicationTypes().firstWhere(
        (type) => type.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}

// Enhanced Package Model with Communication Type and Duration
class PackageModel {
  final int id;
  final String name;
  final double price;
  final int duration; // Added duration field
  final String clinicName;
  final CommunicationType communicationType;

  PackageModel({
    required this.id,
    required this.name,
    required this.price,
    required this.duration,
    required this.clinicName,
    required this.communicationType,
  });

 factory PackageModel.fromJson(Map<String, dynamic> json, String clinicName) {
  final packageName = json['packages_name'] ?? 'Unknown Package';

  // Match communication type by name
  final communicationType = CommunicationTypes.getByName(packageName) ??
      CommunicationTypes.getById(4)!; // fallback to Visit Clinic if no match

  return PackageModel(
    id: int.parse(json['package_id'].toString()),
    name: packageName,
    price: double.parse(json['packages_price'].toString()),
    duration: int.parse(json['packages_duration']?.toString() ?? '30'),
    clinicName: clinicName,
    communicationType: communicationType,
  );
}

}