// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchListingResponseStruct extends BaseStruct {
  WatchListingResponseStruct({
    bool? success,
    String? message,
    String? error,
    WatchListingDataStruct? data,
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
  WatchListingDataStruct? _data;
  WatchListingDataStruct get data => _data ?? WatchListingDataStruct();
  set data(WatchListingDataStruct? val) => _data = val;

  void updateData(Function(WatchListingDataStruct) updateFn) {
    updateFn(_data ??= WatchListingDataStruct());
  }

  bool hasData() => _data != null;

  static WatchListingResponseStruct fromMap(Map<String, dynamic> data) =>
      WatchListingResponseStruct(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        error: data['error'] as String?,
        data: WatchListingDataStruct.maybeFromMap(data['data']),
      );

  static WatchListingResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchListingResponseStruct.fromMap(data.cast<String, dynamic>())
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

  static WatchListingResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchListingResponseStruct(
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
          structBuilder: WatchListingDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchListingResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchListingResponseStruct &&
        success == other.success &&
        message == other.message &&
        error == other.error &&
        data == other.data;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([success, message, error, data]);
}

WatchListingResponseStruct createWatchListingResponseStruct({
  bool? success,
  String? message,
  String? error,
  WatchListingDataStruct? data,
}) =>
    WatchListingResponseStruct(
      success: success,
      message: message,
      error: error,
      data: data ?? WatchListingDataStruct(),
    );
