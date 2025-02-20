class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final ApiError? error;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.error,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) {
    return ApiResponse<T>(
      success: json["success"] ?? false,
      data: json["data"] != null ? fromJsonT(json["data"]) : null,
      message: json["message"],
      error: json["error"] != null ? ApiError.fromJson(json["error"]) : null,
    );
  }

  Map<String, dynamic> toJson(Object Function(T) toJsonT) {
    return {
      "success": success,
      "data": data != null ? toJsonT(data as T) : null,
      "message": message,
      "error": error?.toJson(),
    };
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
      errorCode: json["errorCode"] ?? 0,
      errorMessage: json["errorMessage"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "errorCode": errorCode,
      "errorMessage": errorMessage,
    };
  }
}
