import 'dart:io';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/api_service.dart';

class EditProfileData {
  postData({
    required int userId,
    required String phone,
    required String gender,
    required String brithday,
    required String location,
  }) async {
    final api = Api();
    var data = {
      "userId": userId.toString(),
      "phone": phone,
      "gender": gender,
      "brithday": brithday,
      "location": location,
    };

    var response = await api.post(
      uri: linkEditProfile,
      data: data,
    );
    print('uuu${response}');
    return response;
  }
}
