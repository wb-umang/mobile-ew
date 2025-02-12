import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageSearchResponseStruct extends BaseStruct {
  ImageSearchResponseStruct({
    bool? success,
    String? data,
    String? message,
    String? error,
  })  : _success = success,
        _data = data,
        _message = message,
        _error = error;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) => _success = val;

  bool hasSuccess() => _success != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "error" field.
  String? _error;
  String get error => _error ?? '';
  set error(String? val) => _error = val;

  bool hasError() => _error != null;

  static ImageSearchResponseStruct fromMap(Map<String, dynamic> data) =>
      ImageSearchResponseStruct(
        success: data['success'] as bool?,
        data: data['data'] as String?,
        message: data['message'] as String?,
        error: data['error'] as String?,
      );

  static ImageSearchResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? ImageSearchResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'data': _data,
        'message': _message,
        'error': _error,
      }.withoutNulls;

  @override
  String toString() => 'ImageSearchResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageSearchResponseStruct &&
        success == other.success &&
        data == other.data &&
        message == other.message &&
        error == other.error;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([success, data, message, error]);

  @override
  Map<String, dynamic> toSerializableMap() => {
        'success': _success,
        'data': _data,
        'message': _message,
        'error': _error,
      }.withoutNulls;
}

ImageSearchResponseStruct createImageSearchResponseStruct({
  bool? success,
  String? data,
  String? message,
  String? error,
}) =>
    ImageSearchResponseStruct(
      success: success,
      data: data,
      message: message,
      error: error,
    );
