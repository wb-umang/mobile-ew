class ApiResponse {
  final bool success;
  final dynamic data;
  final dynamic excludedFields; // Handle excludedFields if present
  final String message;
  final ApiError? error;

  ApiResponse({
    required this.success,
    required this.data,
    required this.excludedFields,
    required this.message,
    this.error,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    final extractedData = _extractData(json['data']);
    return ApiResponse(
      success: json['success'] ?? false,
      data: extractedData['data'], // Extracted actual data
      excludedFields:
          extractedData['excludedFields'], // Extract excludedFields if present
      message: json['message'] ?? '',
      error: json['error'] != null ? ApiError.fromJson(json['error']) : null,
    );
  }

  static Map<String, dynamic> _extractData(dynamic jsonData) {
    if (jsonData is Map<String, dynamic>) {
      // Traverse nested "data" keys while keeping "excludedFields" if found
      dynamic extractedData;
      dynamic extractedExcludedFields;

      while (jsonData.containsKey('data') &&
          jsonData['data'] is Map<String, dynamic>) {
        if (jsonData.containsKey('excludedFields')) {
          extractedExcludedFields = jsonData['excludedFields'];
        }
        jsonData = jsonData['data'];
      }

      extractedData =
          jsonData.containsKey('data') ? jsonData['data'] : jsonData;
      if (jsonData.containsKey('excludedFields')) {
        extractedExcludedFields = jsonData['excludedFields'];
      }

      return {
        'data': extractedData,
        'excludedFields': extractedExcludedFields,
      };
    }
    return {'data': jsonData, 'excludedFields': null};
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
      errorCode: json['errorCode'] ?? 0,
      errorMessage: json['errorMessage'],
    );
  }
}
