// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchFiltersSubData2Struct extends BaseStruct {
  WatchFiltersSubData2Struct({
    GlobalFilterDataStruct? watchFilters,
  }) : _watchFilters = watchFilters;

  // "watchFilters" field.
  GlobalFilterDataStruct? _watchFilters;
  GlobalFilterDataStruct get watchFilters =>
      _watchFilters ?? GlobalFilterDataStruct();
  set watchFilters(GlobalFilterDataStruct? val) => _watchFilters = val;

  void updateWatchFilters(Function(GlobalFilterDataStruct) updateFn) {
    updateFn(_watchFilters ??= GlobalFilterDataStruct());
  }

  bool hasWatchFilters() => _watchFilters != null;

  static WatchFiltersSubData2Struct fromMap(Map<String, dynamic> data) =>
      WatchFiltersSubData2Struct(
        watchFilters: GlobalFilterDataStruct.maybeFromMap(data['watchFilters']),
      );

  static WatchFiltersSubData2Struct? maybeFromMap(dynamic data) => data is Map
      ? WatchFiltersSubData2Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'watchFilters': _watchFilters?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'watchFilters': serializeParam(
          _watchFilters,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static WatchFiltersSubData2Struct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchFiltersSubData2Struct(
        watchFilters: deserializeStructParam(
          data['watchFilters'],
          ParamType.DataStruct,
          false,
          structBuilder: GlobalFilterDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchFiltersSubData2Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchFiltersSubData2Struct &&
        watchFilters == other.watchFilters;
  }

  @override
  int get hashCode => const ListEquality().hash([watchFilters]);
}

WatchFiltersSubData2Struct createWatchFiltersSubData2Struct({
  GlobalFilterDataStruct? watchFilters,
}) =>
    WatchFiltersSubData2Struct(
      watchFilters: watchFilters ?? GlobalFilterDataStruct(),
    );
