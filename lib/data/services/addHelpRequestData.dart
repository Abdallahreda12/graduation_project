import 'dart:convert';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/api_service.dart';

class AddHelpRequestData {
  postData({
    required int userid,
    required String title,
    required String phone,
    required String date,
    required String location,
    required String description,
    required String socailMediaLink,
    required List<MultipartFile> selectedImages,
  }) async {
    final api = Api();
    var res = await api.post(
      uri: linkAddHelpRequest,
      data: {
        "userid": userid.toString(),
        "title": title,
        "phone": phone,
        "date": date,
        "location": location,
        "description": description,
        "social_media_link": socailMediaLink,
        "files": selectedImages.toString(),
      },
    );
    Map<String, dynamic> data = jsonDecode(res);
    print(data);
    return data;
  }
}
