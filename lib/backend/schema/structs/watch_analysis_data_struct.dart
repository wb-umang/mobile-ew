// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchAnalysisDataStruct extends BaseStruct {
  WatchAnalysisDataStruct({
    WatchAnalysisSubDataStruct? data,
  }) : _data = data;

  // "data" field.
  WatchAnalysisSubDataStruct? _data;
  WatchAnalysisSubDataStruct get data => _data ?? WatchAnalysisSubDataStruct();
  set data(WatchAnalysisSubDataStruct? val) => _data = val;

  void updateData(Function(WatchAnalysisSubDataStruct) updateFn) {
    updateFn(_data ??= WatchAnalysisSubDataStruct());
  }

  bool hasData() => _data != null;

  static WatchAnalysisDataStruct fromMap(Map<String, dynamic> data) =>
      WatchAnalysisDataStruct(
        data: WatchAnalysisSubDataStruct.maybeFromMap(data['data']),
      );

  static WatchAnalysisDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchAnalysisDataStruct.fromMap(data.cast<String, dynamic>())
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

  static WatchAnalysisDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchAnalysisDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: WatchAnalysisSubDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchAnalysisDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchAnalysisDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

WatchAnalysisDataStruct createWatchAnalysisDataStruct({
  WatchAnalysisSubDataStruct? data,
}) =>
    WatchAnalysisDataStruct(
      data: data ?? WatchAnalysisSubDataStruct(),
    );
