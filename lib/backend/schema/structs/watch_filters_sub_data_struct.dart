// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchFiltersSubDataStruct extends BaseStruct {
  WatchFiltersSubDataStruct({
    WatchFiltersSubData2Struct? data,
  }) : _data = data;

  // "data" field.
  WatchFiltersSubData2Struct? _data;
  WatchFiltersSubData2Struct get data => _data ?? WatchFiltersSubData2Struct();
  set data(WatchFiltersSubData2Struct? val) => _data = val;

  void updateData(Function(WatchFiltersSubData2Struct) updateFn) {
    updateFn(_data ??= WatchFiltersSubData2Struct());
  }

  bool hasData() => _data != null;

  static WatchFiltersSubDataStruct fromMap(Map<String, dynamic> data) =>
      WatchFiltersSubDataStruct(
        data: WatchFiltersSubData2Struct.maybeFromMap(data['data']),
      );

  static WatchFiltersSubDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchFiltersSubDataStruct.fromMap(data.cast<String, dynamic>())
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

  static WatchFiltersSubDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchFiltersSubDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: WatchFiltersSubData2Struct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchFiltersSubDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchFiltersSubDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

WatchFiltersSubDataStruct createWatchFiltersSubDataStruct({
  WatchFiltersSubData2Struct? data,
}) =>
    WatchFiltersSubDataStruct(
      data: data ?? WatchFiltersSubData2Struct(),
    );
