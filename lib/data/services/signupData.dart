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
  //
  //
  postSignUpDoctorInfoData({
    required int userid,
    required String usersFirstName,
    required String usersLastName,
    required String phone,
    required String gender,
    required String birthday,
    required String location,
    required String radius,
    required String specialization,
    required String degree,
    required String licensing_info,
    required String years_experience,
    required String hom_visit,
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
      "specialization": specialization,
      "degree": degree,
      "licensing_info": licensing_info,
      "years_experience": years_experience,
      "hom_visit": hom_visit,
    };

    var response = await api.postImagesWithData(
      uri: linkDoctorInfo,
      data: data,
      imageFiles: selectedFiles,
    );
    return response;
  }
  //
  //
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
  //
  //
  postVerificationCodeData({
    required String email,
    required String verfyCode,
  }) async {
    final api = Api();
    var res = await api.post(uri: linkVerfycode, data: {
      "email": email,
      "verfycode": verfyCode,
    });
    Map<String, dynamic> data = jsonDecode(res);
    print(data);
    return data;
  }
}
