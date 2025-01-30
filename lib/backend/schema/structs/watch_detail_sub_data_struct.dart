// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchDetailSubDataStruct extends BaseStruct {
  WatchDetailSubDataStruct({
    WatchDetailSubData2Struct? data,
  }) : _data = data;

  // "data" field.
  WatchDetailSubData2Struct? _data;
  WatchDetailSubData2Struct get data => _data ?? WatchDetailSubData2Struct();
  set data(WatchDetailSubData2Struct? val) => _data = val;

  void updateData(Function(WatchDetailSubData2Struct) updateFn) {
    updateFn(_data ??= WatchDetailSubData2Struct());
  }

  bool hasData() => _data != null;

  static WatchDetailSubDataStruct fromMap(Map<String, dynamic> data) =>
      WatchDetailSubDataStruct(
        data: WatchDetailSubData2Struct.maybeFromMap(data['data']),
      );

  static WatchDetailSubDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchDetailSubDataStruct.fromMap(data.cast<String, dynamic>())
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

  static WatchDetailSubDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchDetailSubDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: WatchDetailSubData2Struct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchDetailSubDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchDetailSubDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

WatchDetailSubDataStruct createWatchDetailSubDataStruct({
  WatchDetailSubData2Struct? data,
}) =>
    WatchDetailSubDataStruct(
      data: data ?? WatchDetailSubData2Struct(),
    );
