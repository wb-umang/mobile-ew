class ApiResponse {
  final bool success;
  final dynamic data;
  final String message;
  final ApiError error;

  ApiResponse({
    required this.success,
    required this.data,
    required this.message,
    required this.error,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      data: json['data'],
      message: json['message'],
      error: ApiError.fromJson(json['error']),
    );
  }
}

class ApiError {
  final int errorCode;
  final String? errorMessage;

  ApiError({
    required this.errorCode,
    this.errorMessage,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      errorCode: json['errorCode'],
      errorMessage: json['errorMessage'],
    );
  }
}
