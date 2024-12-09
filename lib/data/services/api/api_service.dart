import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(BaseOptions(headers: {
  'Content-Type': 'application/json',
  },
  ));

  Future<Response> get(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post("http://192.168.0.107:5000$endpoint", data: data);
    } catch (e) {
      rethrow;
    }
  }
}
