import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/controller/loginController.dart';
import 'package:graduation_project/data/models/adoptionModel.dart';
import 'package:graduation_project/data/models/helpModel.dart';
import 'package:graduation_project/data/models/userInfo.dart';
import 'package:graduation_project/data/services/deleteAdoptionRequestData.dart';
import 'package:graduation_project/data/services/deleteHelpRequestData.dart';
import 'package:graduation_project/data/services/viewMyRequestsData.dart';

abstract class ViewMyRequestsController extends GetxController {
  getRequest();
  deleteAdoptionRequest(id, images);
  deleteHelpRequest(id, images);
}

class ViewMyRequestsControllerImp extends ViewMyRequestsController {
  late int userId;

  bool isLoading = false;
  late UserModel user;
  final List<AdoptionModel> adoptions = [];
  final List<HelpRequestModel> helpRequests = [];
  List<UnifiedItem> mergedItems = [];

  @override
  void onInit() async {
    final LoginControllerImp loginController = Get.find();
    user = loginController.user;
    userId = user.userId;
    await getRequest();
    // Get.delete<LoginControllerImp>();
    super.onInit();
  }

  @override
  getRequest() async {
    isLoading = true;
    update();

    // Clear previous data
    adoptions.clear();
    helpRequests.clear();
    mergedItems.clear();

    var res = await ViewMyRequestsData().postData(userid: userId);

    if (res.containsKey('adoption') && res['adoption'] is List) {
      adoptions.addAll(
        (res['adoption'] as List).map((e) => AdoptionModel.fromJson(e)),
      );
    }

    if (res.containsKey('help') && res['help'] is List) {
      helpRequests.addAll(
        (res['help'] as List).map((e) => HelpRequestModel.fromJson(e)),
      );
    }

    if (adoptions.isNotEmpty) {
      print(adoptions[0].description);
    } else {
      print("No adoption requests found.");
    }

    if (helpRequests.isNotEmpty) {
      print(helpRequests[0].description);
    } else {
      print("No help requests found.");
    }

    mergedItems = [
      ...adoptions.map((a) => UnifiedItem(data: a, type: 'adoption')),
      ...helpRequests.map((h) => UnifiedItem(data: h, type: 'help')),
    ];

    mergedItems.shuffle();
    isLoading = false;
    update();
  }

  @override
  deleteAdoptionRequest(id, images) async {
    isLoading = true;
    update();
    List<String> listImages = [images];
    print(listImages);
    var res = await DeleteAdoptionRequestData()
        .postData(id: id, imageName: listImages);

    if (res != null && res['status'] == 'success') {
      Get.snackbar(
        'Success',
        'Request deleted successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade600,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(15),
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to delete request',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade700,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(15),
      );
    }
    isLoading = false;
    update();
  }

  @override
  deleteHelpRequest(id, images) async {
    isLoading = true;
    update();
    List<String> listImages = [images];
    print(listImages);
    var res =
        await DeleteHelpRequestData().postData(id: id, imageName: listImages);

    if (res != null && res['status'] == 'success') {
      Get.snackbar(
        'Success',
        'Request deleted successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade600,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(15),
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to delete request',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade700,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(15),
      );
    }
    isLoading = false;
    update();
  }
}
