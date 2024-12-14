// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QueryStringsStruct extends BaseStruct {
  QueryStringsStruct({
    String? medianHeadQueryString,
    String? marketPlaceMedianPriceQueryString,
    String? marketPlaceMinPriceQueryString,
    String? marketPlaceMaxPriceQueryString,
    String? auctionMedianPriceQueryString,
    String? auctionMinPriceQueryString,
    String? auctionMaxPriceQueryString,
    String? auctionLatestSalesPriceQueryString,
    String? auctionGraphQueryString,
  })  : _medianHeadQueryString = medianHeadQueryString,
        _marketPlaceMedianPriceQueryString = marketPlaceMedianPriceQueryString,
        _marketPlaceMinPriceQueryString = marketPlaceMinPriceQueryString,
        _marketPlaceMaxPriceQueryString = marketPlaceMaxPriceQueryString,
        _auctionMedianPriceQueryString = auctionMedianPriceQueryString,
        _auctionMinPriceQueryString = auctionMinPriceQueryString,
        _auctionMaxPriceQueryString = auctionMaxPriceQueryString,
        _auctionLatestSalesPriceQueryString =
            auctionLatestSalesPriceQueryString,
        _auctionGraphQueryString = auctionGraphQueryString;

  String? _medianHeadQueryString;
  String? get medianHeadQueryString => _medianHeadQueryString;
  set medianHeadQueryString(String? value) => _medianHeadQueryString = value;

  String? _marketPlaceMedianPriceQueryString;
  String? get marketPlaceMedianPriceQueryString =>
      _marketPlaceMedianPriceQueryString;
  set marketPlaceMedianPriceQueryString(String? value) =>
      _marketPlaceMedianPriceQueryString = value;

  String? _marketPlaceMinPriceQueryString;
  String? get marketPlaceMinPriceQueryString => _marketPlaceMinPriceQueryString;
  set marketPlaceMinPriceQueryString(String? value) =>
      _marketPlaceMinPriceQueryString = value;

  String? _marketPlaceMaxPriceQueryString;
  String? get marketPlaceMaxPriceQueryString => _marketPlaceMaxPriceQueryString;
  set marketPlaceMaxPriceQueryString(String? value) =>
      _marketPlaceMaxPriceQueryString = value;

  String? _auctionMedianPriceQueryString;
  String? get auctionMedianPriceQueryString => _auctionMedianPriceQueryString;
  set auctionMedianPriceQueryString(String? value) =>
      _auctionMedianPriceQueryString = value;

  String? _auctionMinPriceQueryString;
  String? get auctionMinPriceQueryString => _auctionMinPriceQueryString;
  set auctionMinPriceQueryString(String? value) =>
      _auctionMinPriceQueryString = value;

  String? _auctionMaxPriceQueryString;
  String? get auctionMaxPriceQueryString => _auctionMaxPriceQueryString;
  set auctionMaxPriceQueryString(String? value) =>
      _auctionMaxPriceQueryString = value;

  String? _auctionLatestSalesPriceQueryString;
  String? get auctionLatestSalesPriceQueryString =>
      _auctionLatestSalesPriceQueryString;
  set auctionLatestSalesPriceQueryString(String? value) =>
      _auctionLatestSalesPriceQueryString = value;

  String? _auctionGraphQueryString;
  String? get auctionGraphQueryString => _auctionGraphQueryString;
  set auctionGraphQueryString(String? value) =>
      _auctionGraphQueryString = value;

  static QueryStringsStruct fromMap(Map<String, dynamic> data) {
    return QueryStringsStruct(
      medianHeadQueryString: data['medianHeadQueryString'] as String?,
      marketPlaceMedianPriceQueryString:
          data['marketPlaceMedianPriceQueryString'] as String?,
      marketPlaceMinPriceQueryString:
          data['marketPlaceMinPriceQueryString'] as String?,
      marketPlaceMaxPriceQueryString:
          data['marketPlaceMaxPriceQueryString'] as String?,
      auctionMedianPriceQueryString:
          data['auctionMedianPriceQueryString'] as String?,
      auctionMinPriceQueryString: data['auctionMinPriceQueryString'] as String?,
      auctionMaxPriceQueryString: data['auctionMaxPriceQueryString'] as String?,
      auctionLatestSalesPriceQueryString:
          data['auctionLatestSalesPriceQueryString'] as String?,
      auctionGraphQueryString: data['auctionGraphQueryString'] as String?,
    );
  }

  static QueryStringsStruct? maybeFromMap(dynamic data) => data is Map
      ? QueryStringsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'medianHeadQueryString': medianHeadQueryString,
        'marketPlaceMedianPriceQueryString': marketPlaceMedianPriceQueryString,
        'marketPlaceMinPriceQueryString': marketPlaceMinPriceQueryString,
        'marketPlaceMaxPriceQueryString': marketPlaceMaxPriceQueryString,
        'auctionMedianPriceQueryString': auctionMedianPriceQueryString,
        'auctionMinPriceQueryString': auctionMinPriceQueryString,
        'auctionMaxPriceQueryString': auctionMaxPriceQueryString,
        'auctionLatestSalesPriceQueryString':
            auctionLatestSalesPriceQueryString,
        'auctionGraphQueryString': auctionGraphQueryString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'medianHeadQueryString':
            serializeParam(medianHeadQueryString, ParamType.String),
        'marketPlaceMedianPriceQueryString':
            serializeParam(marketPlaceMedianPriceQueryString, ParamType.String),
        'marketPlaceMinPriceQueryString':
            serializeParam(marketPlaceMinPriceQueryString, ParamType.String),
        'marketPlaceMaxPriceQueryString':
            serializeParam(marketPlaceMaxPriceQueryString, ParamType.String),
        'auctionMedianPriceQueryString':
            serializeParam(auctionMedianPriceQueryString, ParamType.String),
        'auctionMinPriceQueryString':
            serializeParam(auctionMinPriceQueryString, ParamType.String),
        'auctionMaxPriceQueryString':
            serializeParam(auctionMaxPriceQueryString, ParamType.String),
        'auctionLatestSalesPriceQueryString': serializeParam(
            auctionLatestSalesPriceQueryString, ParamType.String),
        'auctionGraphQueryString':
            serializeParam(auctionGraphQueryString, ParamType.String),
      }.withoutNulls;

  static QueryStringsStruct fromSerializableMap(Map<String, dynamic> data) =>
      QueryStringsStruct(
        medianHeadQueryString: deserializeParam(
            data['medianHeadQueryString'], ParamType.String, false),
        marketPlaceMedianPriceQueryString: deserializeParam(
            data['marketPlaceMedianPriceQueryString'], ParamType.String, false),
        marketPlaceMinPriceQueryString: deserializeParam(
            data['marketPlaceMinPriceQueryString'], ParamType.String, false),
        marketPlaceMaxPriceQueryString: deserializeParam(
            data['marketPlaceMaxPriceQueryString'], ParamType.String, false),
        auctionMedianPriceQueryString: deserializeParam(
            data['auctionMedianPriceQueryString'], ParamType.String, false),
        auctionMinPriceQueryString: deserializeParam(
            data['auctionMinPriceQueryString'], ParamType.String, false),
        auctionMaxPriceQueryString: deserializeParam(
            data['auctionMaxPriceQueryString'], ParamType.String, false),
        auctionLatestSalesPriceQueryString: deserializeParam(
            data['auctionLatestSalesPriceQueryString'],
            ParamType.String,
            false),
        auctionGraphQueryString: deserializeParam(
            data['auctionGraphQueryString'], ParamType.String, false),
      );

  @override
  String toString() => 'QueryStringsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QueryStringsStruct &&
        medianHeadQueryString == other.medianHeadQueryString &&
        marketPlaceMedianPriceQueryString ==
            other.marketPlaceMedianPriceQueryString &&
        marketPlaceMinPriceQueryString ==
            other.marketPlaceMinPriceQueryString &&
        marketPlaceMaxPriceQueryString ==
            other.marketPlaceMaxPriceQueryString &&
        auctionMedianPriceQueryString == other.auctionMedianPriceQueryString &&
        auctionMinPriceQueryString == other.auctionMinPriceQueryString &&
        auctionMaxPriceQueryString == other.auctionMaxPriceQueryString &&
        auctionLatestSalesPriceQueryString ==
            other.auctionLatestSalesPriceQueryString &&
        auctionGraphQueryString == other.auctionGraphQueryString;
  }

  @override
  int get hashCode => const ListEquality().hash([
        medianHeadQueryString,
        marketPlaceMedianPriceQueryString,
        marketPlaceMinPriceQueryString,
        marketPlaceMaxPriceQueryString,
        auctionMedianPriceQueryString,
        auctionMinPriceQueryString,
        auctionMaxPriceQueryString,
        auctionLatestSalesPriceQueryString,
        auctionGraphQueryString,
      ]);
}

QueryStringsStruct createQueryStringsStruct({
  String? medianHeadQueryString,
  String? marketPlaceMedianPriceQueryString,
  String? marketPlaceMinPriceQueryString,
  String? marketPlaceMaxPriceQueryString,
  String? auctionMedianPriceQueryString,
  String? auctionMinPriceQueryString,
  String? auctionMaxPriceQueryString,
  String? auctionLatestSalesPriceQueryString,
  String? auctionGraphQueryString,
}) =>
    QueryStringsStruct(
      medianHeadQueryString: medianHeadQueryString,
      marketPlaceMedianPriceQueryString: marketPlaceMedianPriceQueryString,
      marketPlaceMinPriceQueryString: marketPlaceMinPriceQueryString,
      marketPlaceMaxPriceQueryString: marketPlaceMaxPriceQueryString,
      auctionMedianPriceQueryString: auctionMedianPriceQueryString,
      auctionMinPriceQueryString: auctionMinPriceQueryString,
      auctionMaxPriceQueryString: auctionMaxPriceQueryString,
      auctionLatestSalesPriceQueryString: auctionLatestSalesPriceQueryString,
      auctionGraphQueryString: auctionGraphQueryString,
    );
