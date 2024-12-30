import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  /// Initialize Dio with default settings
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://chat-backend-6xf2.onrender.com', // Replace with your API base URL
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  /// GET request
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    return await dio.get(url, queryParameters: query, options: options);
  }

  /// POST request
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    return await dio.post(url, data: data, queryParameters: query, options: options);
  }

  /// PUT request
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    return await dio.put(url, data: data, queryParameters: query, options: options);
  }

  /// DELETE request
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    return await dio.delete(url, queryParameters: query, options: options);
  }
}
