import 'dart:io';

class ClinicFormModel {
  String name = '';
  String location = '';
  String phone = '';
  List<String> dayOfWeek = [];
  String startTime = '';
  String endTime = '';
  File? file;

  ClinicFormModel();
}
