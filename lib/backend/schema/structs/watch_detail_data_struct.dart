// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchDetailDataStruct extends BaseStruct {
  WatchDetailDataStruct({
    WatchDetailSubDataStruct? data,
  }) : _data = data;

  // "data" field.
  WatchDetailSubDataStruct? _data;
  WatchDetailSubDataStruct get data => _data ?? WatchDetailSubDataStruct();
  set data(WatchDetailSubDataStruct? val) => _data = val;

  void updateData(Function(WatchDetailSubDataStruct) updateFn) {
    updateFn(_data ??= WatchDetailSubDataStruct());
  }

  bool hasData() => _data != null;

  static WatchDetailDataStruct fromMap(Map<String, dynamic> data) =>
      WatchDetailDataStruct(
        data: WatchDetailSubDataStruct.maybeFromMap(data['data']),
      );

  static WatchDetailDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchDetailDataStruct.fromMap(data.cast<String, dynamic>())
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

  static WatchDetailDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      WatchDetailDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: WatchDetailSubDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchDetailDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchDetailDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

WatchDetailDataStruct createWatchDetailDataStruct({
  WatchDetailSubDataStruct? data,
}) =>
    WatchDetailDataStruct(
      data: data ?? WatchDetailSubDataStruct(),
    );
