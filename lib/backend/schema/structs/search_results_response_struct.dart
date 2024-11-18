// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchResultsResponseStruct extends BaseStruct {
  SearchResultsResponseStruct({
    bool? success,
    String? message,
    String? error,
    SearchResultsDataStruct? data,
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
  SearchResultsDataStruct? _data;
  SearchResultsDataStruct get data => _data ?? SearchResultsDataStruct();
  set data(SearchResultsDataStruct? val) => _data = val;

  void updateData(Function(SearchResultsDataStruct) updateFn) {
    updateFn(_data ??= SearchResultsDataStruct());
  }

  bool hasData() => _data != null;

  static SearchResultsResponseStruct fromMap(Map<String, dynamic> data) =>
      SearchResultsResponseStruct(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        error: data['error'] as String?,
        data: SearchResultsDataStruct.maybeFromMap(data['data']),
      );

  static SearchResultsResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchResultsResponseStruct.fromMap(data.cast<String, dynamic>())
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

  static SearchResultsResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SearchResultsResponseStruct(
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
          structBuilder: SearchResultsDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SearchResultsResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchResultsResponseStruct &&
        success == other.success &&
        message == other.message &&
        error == other.error &&
        data == other.data;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([success, message, error, data]);
}

SearchResultsResponseStruct createSearchResultsResponseStruct({
  bool? success,
  String? message,
  String? error,
  SearchResultsDataStruct? data,
}) =>
    SearchResultsResponseStruct(
      success: success,
      message: message,
      error: error,
      data: data ?? SearchResultsDataStruct(),
    );
