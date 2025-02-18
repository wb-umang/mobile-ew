// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchDetailsStruct extends BaseStruct {
  WatchDetailsStruct({
    WatchListingStruct? watchDetail,
    GraphDataPoints? graphDataPoints,
  })  : _watchDetail = watchDetail,
        _graphDataPoints = graphDataPoints;

  // "watchDetail" field.
  WatchListingStruct? _watchDetail;
  WatchListingStruct get watchDetail => _watchDetail ?? WatchListingStruct();
  set watchDetail(WatchListingStruct? val) => _watchDetail = val;

  // "graphDataPoints" field.
  GraphDataPoints? _graphDataPoints;
  GraphDataPoints get graphDataPoints =>
      _graphDataPoints ??
      GraphDataPoints(
        auctionFirstPointDate: '',
        dealersFirstPointDate: '',
      );
  set graphDataPoints(GraphDataPoints? val) => _graphDataPoints = val;

  void updatewatchDetail(Function(WatchListingStruct) updateFn) {
    updateFn(_watchDetail ??= WatchListingStruct());
  }

  bool haswatchDetail() => _watchDetail != null;

  static WatchDetailsStruct fromMap(Map<String, dynamic> data) =>
      WatchDetailsStruct(
        watchDetail: WatchListingStruct.maybeFromMap(data['watchDetail']),
        graphDataPoints: GraphDataPoints.maybeFromMap(data['graphDataPoints']),
      );

  static WatchDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'watchDetail': _watchDetail?.toMap(),
        'graphDataPoints': _graphDataPoints?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'watchDetail': serializeParam(
          _watchDetail,
          ParamType.DataStruct,
        ),
        'graphDataPoints': serializeParam(
          _graphDataPoints,
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
        graphDataPoints: deserializeStructParam(
          data['graphDataPoints'],
          ParamType.DataStruct,
          false,
          structBuilder: GraphDataPoints.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WatchDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchDetailsStruct &&
        watchDetail == other.watchDetail &&
        graphDataPoints == other.graphDataPoints;
  }

  @override
  int get hashCode => const ListEquality().hash([watchDetail, graphDataPoints]);
}

WatchDetailsStruct createWatchDetailsStruct({
  WatchListingStruct? watchDetail,
  GraphDataPoints? graphDataPoints,
}) =>
    WatchDetailsStruct(
      watchDetail: watchDetail ?? WatchListingStruct(),
      graphDataPoints: graphDataPoints ??
          GraphDataPoints(
            auctionFirstPointDate: '',
            dealersFirstPointDate: '',
          ),
    );

class GraphDataPoints extends BaseStruct {
  final String auctionFirstPointDate;
  final String dealersFirstPointDate;

  GraphDataPoints({
    required this.auctionFirstPointDate,
    required this.dealersFirstPointDate,
  });

  // Method to create an instance from a map
  static GraphDataPoints fromMap(Map<String, dynamic> data) {
    return GraphDataPoints(
      auctionFirstPointDate: data['auctionFirstPointDate'] ?? '',
      dealersFirstPointDate: data['dealersFirstPointDate'] ?? '',
    );
  }

  // Method to create an instance from a nullable map
  static GraphDataPoints? maybeFromMap(Map<String, dynamic>? data) {
    if (data == null) return null;
    return GraphDataPoints.fromMap(data);
  }

  // Method to convert the instance to a map
  Map<String, dynamic> toMap() {
    return {
      'auctionFirstPointDate': auctionFirstPointDate,
      'dealersFirstPointDate': dealersFirstPointDate,
    };
  }

  // Method to create an instance from a serializable map
  static GraphDataPoints fromSerializableMap(Map<String, dynamic> data) {
    return GraphDataPoints(
      auctionFirstPointDate: data['auctionFirstPointDate'] ?? '',
      dealersFirstPointDate: data['dealersFirstPointDate'] ?? '',
    );
  }

  // Implementing the toSerializableMap method
  @override
  Map<String, dynamic> toSerializableMap() {
    return {
      'auctionFirstPointDate': auctionFirstPointDate,
      'dealersFirstPointDate': dealersFirstPointDate,
    };
  }
}
