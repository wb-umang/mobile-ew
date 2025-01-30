// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterValueStruct extends BaseStruct {
  FilterValueStruct({
    int? count,
    String? search,
    bool? getAll,
    bool? getChild,
  })  : _count = count,
        _search = search,
        _getAll = getAll,
        _getChild = getChild;

  // "count" field.
  int? _count;
  int get count => _count ?? 5;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "search" field.
  String? _search;
  String get search => _search ?? '';
  set search(String? val) => _search = val;

  bool hasSearch() => _search != null;

  // "getAll" field.
  bool? _getAll;
  bool get getAll => _getAll ?? false;
  set getAll(bool? val) => _getAll = val;

  bool hasGetAll() => _getAll != null;

  // "getChild" field.
  bool? _getChild;
  bool get getChild => _getChild ?? false;
  set getChild(bool? val) => _getChild = val;

  bool hasGetChild() => _getChild != null;

  static FilterValueStruct fromMap(Map<String, dynamic> data) =>
      FilterValueStruct(
        count: castToType<int>(data['count']),
        search: data['search'] as String?,
        getAll: data['getAll'] as bool?,
        getChild: data['getChild'] as bool?,
      );

  static FilterValueStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterValueStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'count': _count,
        'search': _search,
        'getAll': _getAll,
        'getChild': _getChild,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'search': serializeParam(
          _search,
          ParamType.String,
        ),
        'getAll': serializeParam(
          _getAll,
          ParamType.bool,
        ),
        'getChild': serializeParam(
          _getChild,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FilterValueStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilterValueStruct(
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        search: deserializeParam(
          data['search'],
          ParamType.String,
          false,
        ),
        getAll: deserializeParam(
          data['getAll'],
          ParamType.bool,
          false,
        ),
        getChild: deserializeParam(
          data['getChild'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FilterValueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilterValueStruct &&
        count == other.count &&
        search == other.search &&
        getAll == other.getAll &&
        getChild == other.getChild;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([count, search, getAll, getChild]);
}

FilterValueStruct createFilterValueStruct({
  int? count,
  String? search,
  bool? getAll,
  bool? getChild,
}) =>
    FilterValueStruct(
      count: count,
      search: search,
      getAll: getAll,
      getChild: getChild,
    );
