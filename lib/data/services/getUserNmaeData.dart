import 'dart:convert';
import 'package:graduation_project/api_links.dart';
import 'package:http/http.dart' as http;

class GetUserNameData {
  Future<dynamic> getUserData({required int userId}) async {
    try {
      final response = await http.post(
        Uri.parse(linkGetUserName),
        body: {
          "userid": userId.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("✅ GetUserNameData Success: $data");
        return data;
      } else {
        print("❌ Server error: ${response.statusCode}");
        return {"status": "error", "message": "Server error"};
      }
    } catch (e) {
      print("❌ Exception in GetUserNameData: $e");
      return {"status": "error", "message": e.toString()};
    }
  }
}
