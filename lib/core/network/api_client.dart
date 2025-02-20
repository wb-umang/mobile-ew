import 'package:dio/dio.dart';
import 'package:every_watch/core/network/api_endpoints.dart';
import 'package:every_watch/core/network/api_interceptor.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    // Add interceptors (for logging & authentication)
    _dio.interceptors.add(ApiInterceptor(_dio));
  }

  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    return await _dio.get(path, queryParameters: query);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }

  Future<Response> put(String path, {dynamic data}) async {
    return await _dio.put(path, data: data);
  }

  Future<Response> delete(String path) async {
    return await _dio.delete(path);
  }
}
