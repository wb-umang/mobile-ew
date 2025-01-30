// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchListingSubDataStruct extends BaseStruct {
  WatchListingSubDataStruct({
    AuctionWiseListingDataStruct? data,
  }) : _data = data;

  // "data" field.
  AuctionWiseListingDataStruct? _data;
  AuctionWiseListingDataStruct get data =>
      _data ?? AuctionWiseListingDataStruct();
  set data(AuctionWiseListingDataStruct? val) => _data = val;

  void updateData(Function(AuctionWiseListingDataStruct) updateFn) {
    updateFn(_data ??= AuctionWiseListingDataStruct());
  }

  bool hasData() => _data != null;

  static WatchListingSubDataStruct fromMap(Map<String, dynamic> data) =>
      WatchListingSubDataStruct(
        data: AuctionWiseListingDataStruct.maybeFromMap(data['data']),
      );

  static WatchListingSubDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchListingSubDataStruct.fromMap(data.cast<String, dynamic>())
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

  static WatchListingSubDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WatchListingSubDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: AuctionWiseListingDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchListingSubDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchListingSubDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

WatchListingSubDataStruct createWatchListingSubDataStruct({
  AuctionWiseListingDataStruct? data,
}) =>
    WatchListingSubDataStruct(
      data: data ?? AuctionWiseListingDataStruct(),
    );
