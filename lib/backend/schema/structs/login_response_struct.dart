// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginResponseStruct extends BaseStruct {
  LoginResponseStruct({
    bool? success,
    LoginDataStruct? data,
    String? message,
    ErrorStruct? error,
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
  LoginDataStruct? _data;
  LoginDataStruct get data => _data ?? LoginDataStruct();
  set data(LoginDataStruct? val) => _data = val;

  void updateData(Function(LoginDataStruct) updateFn) {
    updateFn(_data ??= LoginDataStruct());
  }

  bool hasData() => _data != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "error" field.
  ErrorStruct? _error;
  ErrorStruct get error => _error ?? ErrorStruct();
  set error(ErrorStruct? val) => _error = val;

  void updateError(Function(ErrorStruct) updateFn) {
    updateFn(_error ??= ErrorStruct());
  }

  bool hasError() => _error != null;

  static LoginResponseStruct fromMap(Map<String, dynamic> data) =>
      LoginResponseStruct(
        success: data['success'] as bool?,
        data: LoginDataStruct.maybeFromMap(data['data']),
        message: data['message'] as String?,
        error: ErrorStruct.maybeFromMap(data['error']),
      );

  static LoginResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? LoginResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'data': _data?.toMap(),
        'message': _message,
        'error': _error?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'success': serializeParam(
          _success,
          ParamType.bool,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'error': serializeParam(
          _error,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static LoginResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoginResponseStruct(
        success: deserializeParam(
          data['success'],
          ParamType.bool,
          false,
        ),
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: LoginDataStruct.fromSerializableMap,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        error: deserializeStructParam(
          data['error'],
          ParamType.DataStruct,
          false,
          structBuilder: ErrorStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LoginResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LoginResponseStruct &&
        success == other.success &&
        data == other.data &&
        message == other.message &&
        error == other.error;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([success, data, message, error]);
}

LoginResponseStruct createLoginResponseStruct({
  bool? success,
  LoginDataStruct? data,
  String? message,
  ErrorStruct? error,
}) =>
    LoginResponseStruct(
      success: success,
      data: data ?? LoginDataStruct(),
      message: message,
      error: error ?? ErrorStruct(),
    );
