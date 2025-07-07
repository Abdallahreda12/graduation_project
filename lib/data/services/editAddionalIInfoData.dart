import 'dart:convert';
import 'dart:io';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/api_service.dart';

class EditAddionalInfoData {
  postData({
    required int userId,
    required String users_first_name,
    required String users_last_name,
    required String interest_id,
    required String adoption_preference,
    required String looking_for_adoption,
    required String adopted_before,
    required String preferred_age_range,
    required String has_experience_caring,
    required String oldimagename,
    required List<File> files,
  }) async {
    final api = Api();
    var data = {
      "userId": userId.toString(),
      "users_first_name": users_first_name,
      "users_last_name": users_last_name,
      "interest_id": interest_id,
      "adoption_preference": adoption_preference,
      "looking_for_adoption": looking_for_adoption == "Yes" ? "1" : "0",
      "adopted_before": adopted_before == "Yes" ? "1" : "0",
      "preferred_age_range": preferred_age_range,
      "has_experience_caring": has_experience_caring,
      "oldimagename": oldimagename,
    };
    print("sssssssssssssssssssssssssssssssssssssssssss");
    var response = await api.postImagesWithData(
      uri: linkEditAdditionalInfo,
      data: data,
      imageFiles: files,
    );
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(response);
    return response;
  }
}
