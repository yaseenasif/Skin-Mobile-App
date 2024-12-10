import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(BaseOptions(headers: {
    'Content-Type': 'application/json',  // Default header, can be changed dynamically
  }));

  Future<Response> get(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } catch (e) {
      rethrow;
    }
  }

  // Generic post method that can handle FormData, Map<String, dynamic>, String, and more
  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      // If the data is FormData, handle it as multipart
      if (data is FormData) {
        return await _dio.post(
          "http://192.168.0.107:5000$endpoint",
          data: data,
        );
      }
      // If the data is Map<String, dynamic>, send it as JSON
      else if (data is Map<String, dynamic>) {
        return await _dio.post(
          "http://192.168.0.107:5000$endpoint",
          data: data,
        );
      }
      // If the data is a String (e.g., for raw data), send it as a raw body
      else if (data is String) {
        return await _dio.post(
          "http://192.168.0.107:5000$endpoint",
          data: data,
        );
      }
      // Default case if data is of an unexpected type
      else {
        throw Exception('Unsupported data type');
      }
    } catch (e) {
      rethrow;
    }
  }
}
