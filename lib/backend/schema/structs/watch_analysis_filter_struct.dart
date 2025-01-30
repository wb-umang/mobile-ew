// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchAnalysisFilterStruct extends BaseStruct {
  WatchAnalysisFilterStruct({
    int? watchId,
  }) : _watchId = watchId;

  // "watchId" field.
  int? _watchId;
  int get watchId => _watchId ?? 30;
  set watchId(int? val) => _watchId = val;

  void incrementwatchId(int amount) => watchId = watchId + amount;

  bool haswatchId() => _watchId != null;

  static WatchAnalysisFilterStruct fromMap(Map<String, dynamic> data) =>
      WatchAnalysisFilterStruct(
        watchId: castToType<int>(data['watchId']),
      );

  static WatchAnalysisFilterStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchAnalysisFilterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'watchId': _watchId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'watchId': serializeParam(
          _watchId,
          ParamType.int,
        ),
      }.withoutNulls;

  static WatchAnalysisFilterStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchAnalysisFilterStruct(
        watchId: deserializeParam(
          data['watchId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'WatchAnalysisFilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchAnalysisFilterStruct && watchId == other.watchId;
  }

  @override
  int get hashCode => const ListEquality().hash([watchId]);
}

WatchAnalysisFilterStruct createWatchAnalysisFilterStruct({
  int? watchId,
}) =>
    WatchAnalysisFilterStruct(
      watchId: watchId,
    );
