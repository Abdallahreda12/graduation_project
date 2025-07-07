import 'dart:convert';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/api_service.dart';

class ViewAddionalInfoData {
  Future<Map<String, dynamic>> postDataForUser({
    required int userId,
  }) async {
    final api = Api();
    var data = {
      "userId": userId.toString(),
    };

    var response = await api.post(
      uri: linkViewAdditionalInfo,
      data: data,
    );
    print("📥 User response received:");
    print(
        ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;");
    Map<String, dynamic> decoded = json.decode(response);
    return decoded;
  }

  Future<Map<String, dynamic>> postDataForDoctor({
    required int userId,
  }) async {
    final api = Api();
    var data = {
      "userId": userId.toString(),
    };
    print("🔍 Sending request to get doctor additional info...");
    var response = await api.post(
      //edite this link ViewAdditionalInfoForDoctor
      uri: linkViewAdditionalInfo,
      data: data,
    );
    print("📥 Doctor response received:");
    print(response);
    return response;
  }
}
