import 'dart:io';

class PackageModel {
  String name = '';
  String price = '';
  
  PackageModel({this.name = '', this.price = ''});
}

class ClinicFormModel {
  String name = '';
  String location = '';
  String phone = '';
  List<String> dayOfWeek = [];
  String startTime = '';
  String endTime = '';
  File? file;
  List<PackageModel> packages = []; // Add packages list
  
  ClinicFormModel();
}