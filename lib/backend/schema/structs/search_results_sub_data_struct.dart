// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchResultsSubDataStruct extends BaseStruct {
  SearchResultsSubDataStruct({
    SearchResultsSubData2Struct? data,
  }) : _data = data;

  // "data" field.
  SearchResultsSubData2Struct? _data;
  SearchResultsSubData2Struct get data =>
      _data ?? SearchResultsSubData2Struct();
  set data(SearchResultsSubData2Struct? val) => _data = val;

  void updateData(Function(SearchResultsSubData2Struct) updateFn) {
    updateFn(_data ??= SearchResultsSubData2Struct());
  }

  bool hasData() => _data != null;

  static SearchResultsSubDataStruct fromMap(Map<String, dynamic> data) =>
      SearchResultsSubDataStruct(
        data: SearchResultsSubData2Struct.maybeFromMap(data['data']),
      );

  static SearchResultsSubDataStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchResultsSubDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SearchResultsSubDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SearchResultsSubDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: SearchResultsSubData2Struct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SearchResultsSubDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchResultsSubDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

SearchResultsSubDataStruct createSearchResultsSubDataStruct({
  SearchResultsSubData2Struct? data,
}) =>
    SearchResultsSubDataStruct(
      data: data ?? SearchResultsSubData2Struct(),
    );
