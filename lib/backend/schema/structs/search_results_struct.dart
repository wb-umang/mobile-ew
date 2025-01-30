import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchResultsStruct extends BaseStruct {
  SearchResultsStruct({
    String? query,
    bool? includeAllFilters,
  })  : _query = query ?? '',
        _includeAllFilters = includeAllFilters ?? false;

  String? _query;
  bool? _includeAllFilters;

  String get query => _query!;
  set query(String val) => _query = val;

  bool get includeAllFilters => _includeAllFilters!;
  set includeAllFilters(bool val) => _includeAllFilters = val;

  static SearchResultsStruct fromMap(Map<String, dynamic> data) =>
      SearchResultsStruct(
        query: data['query'] as String?,
        includeAllFilters: data['includeAllFilters'] as bool?,
      );

  static SearchResultsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SearchResultsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'query': _query,
        'includeAllFilters': _includeAllFilters,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'query': serializeParam(_query, ParamType.String),
        'includeAllFilters': serializeParam(_includeAllFilters, ParamType.bool),
      }.withoutNulls;

  static SearchResultsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchResultsStruct(
        query: deserializeParam(
          data['query'],
          ParamType.String,
          false,
        ),
        includeAllFilters: deserializeParam(
          data['query'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() =>
      'SearchResultsStruct(query: $query, includeAllFilters: $includeAllFilters)';

  @override
  bool operator ==(Object other) =>
      other is SearchResultsStruct &&
      other.query == query &&
      other.includeAllFilters == includeAllFilters;

  @override
  int get hashCode => Object.hash(query, includeAllFilters);
}
