import 'dart:convert';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/api_service.dart';

class DeleteAdoptionRequestData {
  postData({
    required int id,
    required List<String> imageName,
  }) async {
    final api = Api();
    var res = await api.post(
      uri: linkDeleteAdoptionReq,
      data: {
        "id": id.toString(),
        "imageNames": jsonEncode(imageName),
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
