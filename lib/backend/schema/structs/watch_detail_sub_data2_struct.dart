// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchDetailSubData2Struct extends BaseStruct {
  WatchDetailSubData2Struct({
    WatchDetailsStruct? watchDetails,
  }) : _watchDetails = watchDetails;

  // "watchDetails" field.
  WatchDetailsStruct? _watchDetails;
  WatchDetailsStruct get watchDetails => _watchDetails ?? WatchDetailsStruct();
  set watchDetails(WatchDetailsStruct? val) => _watchDetails = val;

  void updatewatchDetails(Function(WatchDetailsStruct) updateFn) {
    updateFn(_watchDetails ??= WatchDetailsStruct());
  }

  bool haswatchDetails() => _watchDetails != null;

  static WatchDetailSubData2Struct fromMap(Map<String, dynamic> data) =>
      WatchDetailSubData2Struct(
        watchDetails: WatchDetailsStruct.maybeFromMap(data['watchDetailsById']),
      );

  static WatchDetailSubData2Struct? maybeFromMap(dynamic data) => data is Map
      ? WatchDetailSubData2Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'watchDetailsById': _watchDetails?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'watchDetailsById': serializeParam(
          _watchDetails,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static WatchDetailSubData2Struct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchDetailSubData2Struct(
        watchDetails: deserializeStructParam(
          data['watchDetailsById'],
          ParamType.DataStruct,
          false,
          structBuilder: WatchDetailsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchDetailSubData2Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchDetailSubData2Struct &&
        watchDetails == other.watchDetails;
  }

  @override
  int get hashCode => const ListEquality().hash([watchDetails]);
}

WatchDetailSubData2Struct createWatchDetailSubData2Struct({
  WatchDetailsStruct? watchDetails,
}) =>
    WatchDetailSubData2Struct(
      watchDetails: watchDetails ?? WatchDetailsStruct(),
    );
