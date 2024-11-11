// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuctionWiseListingDataStruct extends BaseStruct {
  AuctionWiseListingDataStruct({
    AuctionWiseListingStruct? auctionWiseListing,
  }) : _auctionWiseListing = auctionWiseListing;

  // "auctionWiseListing" field.
  AuctionWiseListingStruct? _auctionWiseListing;
  AuctionWiseListingStruct get auctionWiseListing =>
      _auctionWiseListing ?? AuctionWiseListingStruct();
  set auctionWiseListing(AuctionWiseListingStruct? val) =>
      _auctionWiseListing = val;

  void updateAuctionWiseListing(Function(AuctionWiseListingStruct) updateFn) {
    updateFn(_auctionWiseListing ??= AuctionWiseListingStruct());
  }

  bool hasAuctionWiseListing() => _auctionWiseListing != null;

  static AuctionWiseListingDataStruct fromMap(Map<String, dynamic> data) =>
      AuctionWiseListingDataStruct(
        auctionWiseListing:
            AuctionWiseListingStruct.maybeFromMap(data['auctionWiseListing']),
      );

  static AuctionWiseListingDataStruct? maybeFromMap(dynamic data) => data is Map
      ? AuctionWiseListingDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'auctionWiseListing': _auctionWiseListing?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'auctionWiseListing': serializeParam(
          _auctionWiseListing,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AuctionWiseListingDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AuctionWiseListingDataStruct(
        auctionWiseListing: deserializeStructParam(
          data['auctionWiseListing'],
          ParamType.DataStruct,
          false,
          structBuilder: AuctionWiseListingStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AuctionWiseListingDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuctionWiseListingDataStruct &&
        auctionWiseListing == other.auctionWiseListing;
  }

  @override
  int get hashCode => const ListEquality().hash([auctionWiseListing]);
}

AuctionWiseListingDataStruct createAuctionWiseListingDataStruct({
  AuctionWiseListingStruct? auctionWiseListing,
}) =>
    AuctionWiseListingDataStruct(
      auctionWiseListing: auctionWiseListing ?? AuctionWiseListingStruct(),
    );
