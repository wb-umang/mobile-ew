// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuctionWiseListingStruct extends BaseStruct {
  AuctionWiseListingStruct({
    List<WatchListingStruct>? allWatchListings,
    int? count,
  })  : _allWatchListings = allWatchListings,
        _count = count;

  // "allWatchListings" field.
  List<WatchListingStruct>? _allWatchListings;
  List<WatchListingStruct> get allWatchListings =>
      _allWatchListings ?? const [];
  set allWatchListings(List<WatchListingStruct>? val) =>
      _allWatchListings = val;

  void updateAllWatchListings(Function(List<WatchListingStruct>) updateFn) {
    updateFn(_allWatchListings ??= []);
  }

  bool hasAllWatchListings() => _allWatchListings != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static AuctionWiseListingStruct fromMap(Map<String, dynamic> data) =>
      AuctionWiseListingStruct(
        allWatchListings: getStructList(
          data['allWatchListings'],
          WatchListingStruct.fromMap,
        ),
        count: castToType<int>(data['count']),
      );

  static AuctionWiseListingStruct? maybeFromMap(dynamic data) => data is Map
      ? AuctionWiseListingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'allWatchListings': _allWatchListings?.map((e) => e.toMap()).toList(),
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'allWatchListings': serializeParam(
          _allWatchListings,
          ParamType.DataStruct,
          isList: true,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static AuctionWiseListingStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AuctionWiseListingStruct(
        allWatchListings: deserializeStructParam<WatchListingStruct>(
          data['allWatchListings'],
          ParamType.DataStruct,
          true,
          structBuilder: WatchListingStruct.fromSerializableMap,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AuctionWiseListingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AuctionWiseListingStruct &&
        listEquality.equals(allWatchListings, other.allWatchListings) &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([allWatchListings, count]);
}

AuctionWiseListingStruct createAuctionWiseListingStruct({
  int? count,
}) =>
    AuctionWiseListingStruct(
      count: count,
    );
