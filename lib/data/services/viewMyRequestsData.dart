import 'dart:convert';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/api_service.dart';

class ViewMyRequestsData {
  postData({
    required int userid,
  }) async {
    final api = Api();
    var res = await api.post(
      uri: linkViewMyRequest,
      data: {
        "userid": userid.toString(),
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
