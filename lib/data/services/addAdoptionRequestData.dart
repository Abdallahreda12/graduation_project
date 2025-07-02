import 'dart:convert';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/api_service.dart';

class AddAdoptionRequestData {
  postData({
    required int userid,
    required String title,
    required String phone,
    required String type,
    required String location,
    required String description,
    required String gender,
    required String age,
    required String size,
    required List<MultipartFile> selectedImages,
  }) async {
    final api = Api();
    var res = await api.post(
      uri: linkAddAdoptionRequest,
      data: {
        "userid": userid.toString(),
        "title": title,
        "phone": phone,
        "type": type,
        "location": location,
        "description": description,
        "gender": gender,
        "files": selectedImages.toString(),
        "size": size,
        "age": age,
      },
    );
    try {
      Map<String, dynamic> data = jsonDecode(res);
      print(data);
      return data;
    } catch (e) {
      print("❌ JSON Parse Failed: $e");
      print("🔁 Raw response body: $res");
    }
  }
}
