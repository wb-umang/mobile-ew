// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchResultsSubData2Struct extends BaseStruct {
  SearchResultsSubData2Struct({
    MasterSearchDataStruct? searchResults,
  }) : _searchResults = searchResults;

  // "searchResults" field.
  MasterSearchDataStruct? _searchResults;
  MasterSearchDataStruct get searchResults =>
      _searchResults ?? MasterSearchDataStruct();
  set searchResults(MasterSearchDataStruct? val) => _searchResults = val;

  void updateSearchResults(Function(MasterSearchDataStruct) updateFn) {
    updateFn(_searchResults ??= MasterSearchDataStruct());
  }

  bool hasSearchResults() => _searchResults != null;

  static SearchResultsSubData2Struct fromMap(Map<String, dynamic> data) =>
      SearchResultsSubData2Struct(
        searchResults:
            MasterSearchDataStruct.maybeFromMap(data['searchResults']),
      );

  static SearchResultsSubData2Struct? maybeFromMap(dynamic data) => data is Map
      ? SearchResultsSubData2Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'searchResults': _searchResults?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'searchResults': serializeParam(
          _searchResults,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SearchResultsSubData2Struct fromSerializableMap(
          Map<String, dynamic> data) =>
      SearchResultsSubData2Struct(
        searchResults: deserializeStructParam(
          data['searchResults'],
          ParamType.DataStruct,
          false,
          structBuilder: MasterSearchDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SearchResultsSubData2Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchResultsSubData2Struct &&
        searchResults == other.searchResults;
  }

  @override
  int get hashCode => const ListEquality().hash([searchResults]);
}

SearchResultsSubData2Struct createSearchResultsSubData2Struct({
  MasterSearchDataStruct? searchResults,
}) =>
    SearchResultsSubData2Struct(
      searchResults: searchResults ?? MasterSearchDataStruct(),
    );
