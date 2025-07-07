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
    required String oldimagename,
    required List<File> files,
  }) async {
    final api = Api();
    var data = {
      "userId": userId.toString(),
      "phone": phone,
      "gender": gender,
      "brithday": brithday,
      "location": location,
      "oldimagename": oldimagename,
    };

    var response = await api.postImagesWithData(
      uri: linkEditProfile,
      data: data,
      imageFiles: files,
    );
    
    return response;
  }
}
