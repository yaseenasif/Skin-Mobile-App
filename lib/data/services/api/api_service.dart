import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(BaseOptions(
          baseUrl: "http://192.168.11.75:5000", // Set the base URL here
          headers: {
            'Content-Type': 'application/json', // Default header
          },
        ));

  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      _handleError(response);
      return response;
    } catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      _handleError(response);
      return response;
    } catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// Handle API response errors by checking the `error` key or status code
  void _handleError(Response response) {
    if (response.data is Map<String, dynamic> &&
        response.data.containsKey('error')) {
      throw Exception(response.data['error']);
    }
    if (response.statusCode == null ||
        response.statusCode! < 200 ||
        response.statusCode! >= 300) {
      throw Exception('Unexpected error: ${response.statusCode}');
    }
  }

  /// Handle Dio-specific errors (e.g., network errors)
  void _handleDioError(Object error) {
    if (error is DioException) {
      if (error.response != null) {
        final message =
            error.response?.data['error'] ?? 'Unknown error occurred';
        throw Exception(message);
      } else if (error.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed out');
      } else if (error.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive timeout');
      } else if (error.type == DioExceptionType.unknown) {
        throw Exception('Network error: ${error.message}');
      }
    } else {
      throw Exception('Unexpected error: $error');
    }
  }

  /// Method to upload image file for prediction
  Future<Response> uploadImageForPrediction(String filePath) async {
    try {
      // Create the form data with the file
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: 'image.jpg'),
      });

      // Send the POST request to the /predict endpoint
      final response = await _dio.post('/predict', data: formData);

      _handleError(response);
      return response;
    } catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }
}
