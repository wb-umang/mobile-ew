// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchResultsDataStruct extends BaseStruct {
  SearchResultsDataStruct({
    SearchResultsSubDataStruct? data,
  }) : _data = data;

  // "data" field.
  SearchResultsSubDataStruct? _data;
  SearchResultsSubDataStruct get data => _data ?? SearchResultsSubDataStruct();
  set data(SearchResultsSubDataStruct? val) => _data = val;

  void updateData(Function(SearchResultsSubDataStruct) updateFn) {
    updateFn(_data ??= SearchResultsSubDataStruct());
  }

  bool hasData() => _data != null;

  static SearchResultsDataStruct fromMap(Map<String, dynamic> data) =>
      SearchResultsDataStruct(
        data: SearchResultsSubDataStruct.maybeFromMap(data['data']),
      );

  static SearchResultsDataStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchResultsDataStruct.fromMap(data.cast<String, dynamic>())
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

  static SearchResultsDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SearchResultsDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: SearchResultsSubDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SearchResultsDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchResultsDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

SearchResultsDataStruct createSearchResultsDataStruct({
  SearchResultsSubDataStruct? data,
}) =>
    SearchResultsDataStruct(
      data: data ?? SearchResultsSubDataStruct(),
    );
