import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/api_service.dart';

class SignupData {
  postData({
    required String email,
    required String password,
  }) async {
    final api = Api();
    var res = await api.post(uri: linkSignup, data: {
      "email": email,
      "password": password,
    });
    return res;
  }
}
