// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ErrorStruct extends BaseStruct {
  ErrorStruct({
    int? errorCode,
    String? errorMessage,
  })  : _errorCode = errorCode,
        _errorMessage = errorMessage;

  // "errorCode" field.
  int? _errorCode;
  int get errorCode => _errorCode ?? 0;
  set errorCode(int? val) => _errorCode = val;

  void incrementErrorCode(int amount) => errorCode = errorCode + amount;

  bool hasErrorCode() => _errorCode != null;

  // "errorMessage" field.
  String? _errorMessage;
  String get errorMessage => _errorMessage ?? '';
  set errorMessage(String? val) => _errorMessage = val;

  bool hasErrorMessage() => _errorMessage != null;

  static ErrorStruct fromMap(Map<String, dynamic> data) => ErrorStruct(
        errorCode: castToType<int>(data['errorCode']),
        errorMessage: data['errorMessage'] as String?,
      );

  static ErrorStruct? maybeFromMap(dynamic data) =>
      data is Map ? ErrorStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'errorCode': _errorCode,
        'errorMessage': _errorMessage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'errorCode': serializeParam(
          _errorCode,
          ParamType.int,
        ),
        'errorMessage': serializeParam(
          _errorMessage,
          ParamType.String,
        ),
      }.withoutNulls;

  static ErrorStruct fromSerializableMap(Map<String, dynamic> data) =>
      ErrorStruct(
        errorCode: deserializeParam(
          data['errorCode'],
          ParamType.int,
          false,
        ),
        errorMessage: deserializeParam(
          data['errorMessage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ErrorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ErrorStruct &&
        errorCode == other.errorCode &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode => const ListEquality().hash([errorCode, errorMessage]);
}

ErrorStruct createErrorStruct({
  int? errorCode,
  String? errorMessage,
}) =>
    ErrorStruct(
      errorCode: errorCode,
      errorMessage: errorMessage,
    );
