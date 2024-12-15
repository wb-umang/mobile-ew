// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchDetailsStruct extends BaseStruct {
  WatchDetailsStruct({
    WatchListingStruct? watchDetail,
  }) : _watchDetail = watchDetail;

  // "watchDetail" field.
  WatchListingStruct? _watchDetail;
  WatchListingStruct get watchDetail => _watchDetail ?? WatchListingStruct();
  set watchDetail(WatchListingStruct? val) => _watchDetail = val;

  void updatewatchDetail(Function(WatchListingStruct) updateFn) {
    updateFn(_watchDetail ??= WatchListingStruct());
  }

  bool haswatchDetail() => _watchDetail != null;

  static WatchDetailsStruct fromMap(Map<String, dynamic> data) =>
      WatchDetailsStruct(
        watchDetail: WatchListingStruct.maybeFromMap(data['watchDetail']),
      );

  static WatchDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'watchDetail': _watchDetail?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'watchDetail': serializeParam(
          _watchDetail,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static WatchDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      WatchDetailsStruct(
        watchDetail: deserializeStructParam(
          data['watchDetail'],
          ParamType.DataStruct,
          false,
          structBuilder: WatchListingStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchDetailsStruct && watchDetail == other.watchDetail;
  }

  @override
  int get hashCode => const ListEquality().hash([watchDetail]);
}

WatchDetailsStruct createWatchDetailsStruct({
  WatchListingStruct? watchDetail,
}) =>
    WatchDetailsStruct(
      watchDetail: watchDetail ?? WatchListingStruct(),
    );
