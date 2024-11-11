// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchListingDataStruct extends BaseStruct {
  WatchListingDataStruct({
    WatchListingSubDataStruct? data,
  }) : _data = data;

  // "data" field.
  WatchListingSubDataStruct? _data;
  WatchListingSubDataStruct get data => _data ?? WatchListingSubDataStruct();
  set data(WatchListingSubDataStruct? val) => _data = val;

  void updateData(Function(WatchListingSubDataStruct) updateFn) {
    updateFn(_data ??= WatchListingSubDataStruct());
  }

  bool hasData() => _data != null;

  static WatchListingDataStruct fromMap(Map<String, dynamic> data) =>
      WatchListingDataStruct(
        data: WatchListingSubDataStruct.maybeFromMap(data['data']),
      );

  static WatchListingDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchListingDataStruct.fromMap(data.cast<String, dynamic>())
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

  static WatchListingDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchListingDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: WatchListingSubDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchListingDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchListingDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

WatchListingDataStruct createWatchListingDataStruct({
  WatchListingSubDataStruct? data,
}) =>
    WatchListingDataStruct(
      data: data ?? WatchListingSubDataStruct(),
    );
