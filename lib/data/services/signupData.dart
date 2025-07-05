import 'dart:convert';
import 'dart:io';

import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/api_service.dart';

class SignupData {
  postSignUpEmailAndPassData({
    required String email,
    required String password,
  }) async {
    print(password);
    final api = Api();
    var res = await api.post(uri: linkSignup, data: {
      "email": email,
      "password": password,
    });
    Map<String, dynamic> data = jsonDecode(res);
    print(data);
    return data;
  }

  postSignUpUserInfoData({
    required int userid,
    required String usersFirstName,
    required String usersLastName,
    required String phone,
    required String gender,
    required String birthday,
    required String location,
    required String radius,
    required String adoptionPreference,
    required String lookingForAdoption,
    required String adoptedBefore,
    required String preferredAgeRange,
    required String hasExperienceCaring,
    required List<File> selectedFiles,
  }) async {
    final api = Api();
    var data = {
      "userId": userid.toString(),
      "users_first_name": usersFirstName,
      "users_last_name": usersLastName,
      "phone": phone,
      "gender": gender,
      "brithday": birthday,
      "location": location,
      "radius": radius,
      "adoption_preference": adoptionPreference,
      "looking_for_adoption": lookingForAdoption,
      "adopted_before": adoptedBefore,
      "preferred_age_range": preferredAgeRange,
      "has_experience_caring": hasExperienceCaring,
    };

    var response = await api.postImagesWithData(
      uri: linkUserInfo,
      data: data,
      imageFiles: selectedFiles,
    );

    return response;
  }
}
