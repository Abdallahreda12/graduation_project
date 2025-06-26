import 'dart:convert';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/api_service.dart';

class LoginData {
  
  postData({
    required String email,
    required String password,
  }) async {
    final api = Api();
    var res = await api.post(
      uri: linkLogin,
      data: {
        "email": email,
        "password": password,
      },
    );
    Map<String, dynamic> data = jsonDecode(res);
    print(data);
    return data;
  }
}
