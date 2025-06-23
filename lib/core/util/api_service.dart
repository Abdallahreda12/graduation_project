//وريها لعمر
import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "";
  final Dio _dio;

  ApiService(this._dio);

  // GET
  Future<Map<String, dynamic>> get({required String endPoints}) async {
    Uri url = Uri.parse("$_baseUrl$endPoints");

    try {
      final response = await _dio.get("$url");
      return response.data;
    } catch (e) {
      if (e is DioException) {
        print("DioError: ${e.response?.statusCode} - ${e.message}");
        throw Exception("Failed to GET data: ${e.message}");
      } else {
        print("Unexpected error: $e");
        throw Exception("Unexpected error: $e");
      }
    }
  }

  //POST
  Future<Map<String, dynamic>> post({
    required String endPoints,
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  }) async {
    Uri url = Uri.parse("$_baseUrl$endPoints");

    try {
      final response = await _dio.post(
        "$url",
        data: data,
        // options: Options(
        //   headers: headers ?? {
        //     'Content-Type': 'application/json',
        //   },
        // ),
      );

      // Map data = jsonDecode(response.body);
      //   return data;

      return response.data;
    } catch (e) {
      throw Exception('Failed to post: $e');
    }
  }
}


//make object from it when use it 
///  final ApiService apiService;