import 'dart:io';
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
    required List<File> selectedImages,
  }) async {
    final api = Api();
    var data = {
      "userid": userid.toString(),
      "title": title,
      "phone": phone,
      "date": date,
      "location": location,
      "description": description,
      "social_media_link": socailMediaLink,
    };
    print(userid);
    print(title);
    print(phone);

    print(date);
    print(location);
    print(description);
    print(socailMediaLink);
    print(selectedImages);
    var response = await api.postImagesWithData(
      uri: linkAddHelpRequest,
      data: data,
      imageFiles: selectedImages,
    );

    return response;
  }
}
