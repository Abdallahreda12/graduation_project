import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Api {
  // // GET
  // Future<Map<String, dynamic>> get({required String uri}) async {
  //   Uri url = Uri.parse(uri);

  //   try {
  //     final response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       return jsonDecode(response.body);
  //     } else {
  //       print("GET Error: ${response.statusCode}");
  //       throw Exception("Failed to GET data");
  //     }
  //   } catch (e) {
  //     print("Unexpected error: $e");
  //     throw Exception("Unexpected error: $e");
  //   }
  // }

  //POST
  Future<dynamic> post({
    required String uri,
    required Map data,
    // Map<String, dynamic>? headers,
  }) async {
    Uri url = Uri.parse(uri);
    try {
      print("ApiService");
      print(data);
      print(uri);
      final response = await http.post(
        url,
        body: data,
      );
      print(response.body);
      return response.body;
    } catch (e) {
      throw Exception('Failed to post: $e');
    }
  }

  Future<dynamic> postImagesWithData({
    required String uri,
    required Map<String, String> data,
    required List<File> imageFiles,
    String fieldName = 'files',
  }) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(uri));
      request.fields.addAll(data);

      for (var file in imageFiles) {
        var stream = http.ByteStream(file.openRead());
        var length = await file.length();
        var multipartFile = http.MultipartFile(
          fieldName,
          stream,
          length,
          filename: basename(file.path),
        );
        request.files.add(multipartFile);
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print("📦 Raw server response: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            "Upload failed: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("❌ Upload failed: $e");
      return null;
    }
  }
}
