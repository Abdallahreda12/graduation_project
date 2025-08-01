import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/controller/ViewMyRequestsController.dart';
import 'package:graduation_project/core/util/customFunctions.dart';
import 'package:graduation_project/data/services/addAdoptionRequestData.dart';
import 'package:graduation_project/data/services/addHelpRequestData.dart';

abstract class AddRequestController extends GetxController {
  addHelpRequest();
  pickImages();
  getLinkInCurrentLocation();
  addAdoptionRequest();
  openMap(context);
}

class AddRequestControllerImp extends AddRequestController {
  bool isLoading = false;

  late int userid;
  late String title;
  late String description;
  late String locatonLink;
  late String contactInfo = "";
  late String socialmediaLink = "";
  DateTime? selectedDate;

  late String gender = "";
  late String size = "";
  late String age = "";
  late String type;

  List<File> selectedImages = [];
  Set<String> selectedImagePaths = {};

  String selectedType = "help";

  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController locationController = TextEditingController();

  final TextEditingController dateController = TextEditingController();
  final ViewMyRequestsControllerImp viewMyRequestsController = Get.find();

  @override
  void onInit() {
    final HomePageControllerImp homePageController = Get.find();
    userid = homePageController.userId;
    super.onInit();
  }

  @override
  addHelpRequest() async {
    isLoading = true;
    update();

    var res = await AddHelpRequestData().postData(
      userid: userid,
      title: title,
      phone: contactInfo,
      description: description,
      date: selectedDate.toString(),
      location: locationController.text,
      socailMediaLink: socialmediaLink,
      selectedImages: selectedImages, // List<File>
    );

    isLoading = false;
    update();
    viewMyRequestsController.getRequest();
    print(
        "AddReqHelp//////////////////////////////////////////////////////////////////");
    print(res);
  }

  @override
  addAdoptionRequest() async {
    var res = await AddAdoptionRequestData().postData(
      userid: userid,
      title: title,
      phone: contactInfo,
      type: type,
      location: locationController.text,
      description: description,
      gender: gender,
      age: age,
      size: size,
      selectedImages: selectedImages,
    );
    viewMyRequestsController.getRequest();

    print(
        "AddReqAdoption//////////////////////////////////////////////////////////////////");
  }

  @override
  Future<void> pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      selectedImages.addAll(
        result.paths.map((path) => File(path!)).toList(),
      );
    }

    isLoading = false;
    update();
  }

  @override
  getLinkInCurrentLocation() async {
    isLoading = true;
    update();

    locationController.text = await CustomFunctions.getCurrentLocation();
    isLoading = false;
    update();
  }

  @override
  openMap(context) async {
    isLoading = true;
    update();
    CustomFunctions.openGoogleMaps(context);
    update();
    isLoading = false;
  }
}
