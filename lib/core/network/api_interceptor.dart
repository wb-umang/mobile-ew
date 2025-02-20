import 'package:dio/dio.dart';
import 'package:every_watch/core/storage/secure_storage.dart';

class ApiInterceptor extends Interceptor {
  final Dio dio;

  ApiInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("[API Request] ${options.method} ${options.path}");

    // Retrieve token from storage
    String? token = await SecureStorage.getToken();

    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("[API Response] ${response.statusCode} ${response.data}");
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("[API Error] ${err.message}");

    // Handle Token Expiry (Example)
    if (err.response?.statusCode == 401) {
      print("Token expired. Redirect to login.");
      SecureStorage.removeToken();
      // Optionally: Implement token refresh logic
    }

    return handler.next(err);
  }
}
