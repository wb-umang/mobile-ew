// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchFiltersResponseStruct extends BaseStruct {
  WatchFiltersResponseStruct({
    bool? success,
    String? message,
    String? error,
    WatchFiltersDataStruct? data,
  })  : _success = success,
        _message = message,
        _error = error,
        _data = data;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) => _success = val;

  bool hasSuccess() => _success != null;

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

  // "data" field.
  WatchFiltersDataStruct? _data;
  WatchFiltersDataStruct get data => _data ?? WatchFiltersDataStruct();
  set data(WatchFiltersDataStruct? val) => _data = val;

  void updateData(Function(WatchFiltersDataStruct) updateFn) {
    updateFn(_data ??= WatchFiltersDataStruct());
  }

  bool hasData() => _data != null;

  static WatchFiltersResponseStruct fromMap(Map<String, dynamic> data) =>
      WatchFiltersResponseStruct(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        error: data['error'] as String?,
        data: WatchFiltersDataStruct.maybeFromMap(data['data']),
      );

  static WatchFiltersResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchFiltersResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'message': _message,
        'error': _error,
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'success': serializeParam(
          _success,
          ParamType.bool,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'error': serializeParam(
          _error,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static WatchFiltersResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchFiltersResponseStruct(
        success: deserializeParam(
          data['success'],
          ParamType.bool,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        error: deserializeParam(
          data['error'],
          ParamType.String,
          false,
        ),
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: WatchFiltersDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchFiltersResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchFiltersResponseStruct &&
        success == other.success &&
        message == other.message &&
        error == other.error &&
        data == other.data;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([success, message, error, data]);
}

WatchFiltersResponseStruct createWatchFiltersResponseStruct({
  bool? success,
  String? message,
  String? error,
  WatchFiltersDataStruct? data,
}) =>
    WatchFiltersResponseStruct(
      success: success,
      message: message,
      error: error,
      data: data ?? WatchFiltersDataStruct(),
    );
