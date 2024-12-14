// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchAnalysisSubDataStruct extends BaseStruct {
  WatchAnalysisSubDataStruct({
    WatchAnalysisStruct? watchAnalysis,
  }) : _watchAnalysis = watchAnalysis;

  // "data" field.
  WatchAnalysisStruct? _watchAnalysis;
  WatchAnalysisStruct get watchAnalysis =>
      _watchAnalysis ?? WatchAnalysisStruct();
  set data(WatchAnalysisStruct? val) => _watchAnalysis = val;

  void updateData(Function(WatchAnalysisStruct) updateFn) {
    updateFn(_watchAnalysis ??= WatchAnalysisStruct());
  }

  bool hasData() => _watchAnalysis != null;

  static WatchAnalysisSubDataStruct fromMap(
          Map<String, dynamic> watchAnalysis) =>
      WatchAnalysisSubDataStruct(
        watchAnalysis:
            WatchAnalysisStruct.maybeFromMap(watchAnalysis['watchAnalysis']),
      );

  static WatchAnalysisSubDataStruct? maybeFromMap(dynamic watchAnalysis) =>
      watchAnalysis is Map
          ? WatchAnalysisSubDataStruct.fromMap(
              watchAnalysis.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'watchAnalysis': _watchAnalysis?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'watchAnalysis': serializeParam(
          _watchAnalysis,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static WatchAnalysisSubDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchAnalysisSubDataStruct(
        watchAnalysis: deserializeStructParam(
          data['watchAnalysis'],
          ParamType.DataStruct,
          false,
          structBuilder: WatchAnalysisStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchAnalysisSubDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchAnalysisSubDataStruct &&
        watchAnalysis == other.watchAnalysis;
  }

  @override
  int get hashCode => const ListEquality().hash([watchAnalysis]);
}

WatchAnalysisSubDataStruct createWatchAnalysisSubDataStruct({
  WatchAnalysisStruct? watchAnalysis,
}) =>
    WatchAnalysisSubDataStruct(
      watchAnalysis: watchAnalysis ?? WatchAnalysisStruct(),
    );
