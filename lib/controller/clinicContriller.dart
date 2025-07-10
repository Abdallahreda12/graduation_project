import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/data/models/clinicFormModel.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ClinicController extends GetxController {
  List<String> selectedDays = [];

  TimeOfDay? startTime;
  TimeOfDay? endTime;
  File? selectedFile;
  List<ClinicFormModel> clinics = [ClinicFormModel()];
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  Future<void> addMultipleClinics({
    required String userid,
    required String phone,
    required List<ClinicFormModel> clinics,
  }) async {
    for (var clinic in clinics) {
      var uri = Uri.parse(linkAddClinic);

      var request = http.MultipartRequest('POST', uri);

      request.fields['userid'] = userid;
      request.fields['phone'] = phone;
      request.fields['name'] = clinic.name;
      request.fields['location'] = clinic.location;
      request.fields['clinic_phone'] = clinic.phone;
      request.fields['day_of_week'] = clinic.dayOfWeek.toString();
      request.fields['start_time'] = clinic.startTime;
      request.fields['end_time'] = clinic.endTime;
      print(clinic.startTime);

      if (clinic.file != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'files',
            clinic.file!.path,
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }

      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);

        print("🔁 Status Code: ${response.statusCode}");
        print("📩 Response Body: ${response.body}");

        if (response.statusCode == 200) {
          print("✅ Clinic '${clinic.name}' added successfully");
        } else {
          print("❌ Failed to add clinic '${clinic.name}'");
        }
      } catch (e) {
        print("🔥 Exception occurred while uploading clinic: $e");
      }
    }
  }
}

//////////////////////////////////////////////////////////////////////////////////
//there something error when push data 
//don't forget edite userId
//////////////////////////////////////////////////////////////////////////////////