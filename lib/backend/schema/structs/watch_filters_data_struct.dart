// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchFiltersDataStruct extends BaseStruct {
  WatchFiltersDataStruct({
    WatchFiltersSubDataStruct? data,
  }) : _data = data;

  // "data" field.
  WatchFiltersSubDataStruct? _data;
  WatchFiltersSubDataStruct get data => _data ?? WatchFiltersSubDataStruct();
  set data(WatchFiltersSubDataStruct? val) => _data = val;

  void updateData(Function(WatchFiltersSubDataStruct) updateFn) {
    updateFn(_data ??= WatchFiltersSubDataStruct());
  }

  bool hasData() => _data != null;

  static WatchFiltersDataStruct fromMap(Map<String, dynamic> data) =>
      WatchFiltersDataStruct(
        data: WatchFiltersSubDataStruct.maybeFromMap(data['data']),
      );

  static WatchFiltersDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchFiltersDataStruct.fromMap(data.cast<String, dynamic>())
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

  static WatchFiltersDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchFiltersDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: WatchFiltersSubDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchFiltersDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchFiltersDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

WatchFiltersDataStruct createWatchFiltersDataStruct({
  WatchFiltersSubDataStruct? data,
}) =>
    WatchFiltersDataStruct(
      data: data ?? WatchFiltersSubDataStruct(),
    );
