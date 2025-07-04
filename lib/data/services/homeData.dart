import 'dart:convert';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/api_service.dart';

class HomeData {
  postData({
    required int userid,
  }) async {
    final api = Api();
    var res = await api.post(
      uri: linkHomePage,
      data: {
        "useId": userid.toString(),
      },
    );
    Map<String, dynamic> data = jsonDecode(res);
    print("HomeData");
    print(data);
    return data;
  }
}
