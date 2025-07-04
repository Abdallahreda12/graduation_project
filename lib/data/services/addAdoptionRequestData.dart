import 'dart:io';
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
    required List<File> selectedImages,
  }) async {
    final api = Api();

    var data = {
      "userid": userid.toString(),
      "title": title,
      "phone": phone,
      "type": type,
      "location": location,
      "description": description,
      "gender": gender,
      "size": size,
      "age": age,
    };

    var response = await api.postImagesWithData(
      uri: linkAddAdoptionRequest,
      data: data,
      imageFiles: selectedImages,
    );

    return response;
  }
}
