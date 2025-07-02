import 'package:http/http.dart' as http;

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
      return response.body;
    } catch (e) {
      throw Exception('Failed to post: $e');
    }
  }
}
