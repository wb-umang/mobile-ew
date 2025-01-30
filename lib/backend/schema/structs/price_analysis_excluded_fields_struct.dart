// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PriceAnalysisExcludedFieldsStruct extends BaseStruct {
  PriceAnalysisExcludedFieldsStruct({
    List<String>? auctionPriceMedian,
    List<String>? marketPlacePriceMedian,
    List<String>? date,
    List<String>? auctionPriceAnalysis,
  })  : _auctionPriceMedian = auctionPriceMedian,
        _marketPlacePriceMedian = marketPlacePriceMedian,
        _date = date,
        _auctionPriceAnalysis = auctionPriceAnalysis;

  List<String>? _auctionPriceMedian;
  List<String>? get auctionPriceMedian => _auctionPriceMedian;
  set auctionPriceMedian(List<String>? value) => _auctionPriceMedian = value;

  List<String>? _marketPlacePriceMedian;
  List<String>? get marketPlacePriceMedian => _marketPlacePriceMedian;
  set marketPlacePriceMedian(List<String>? value) =>
      _marketPlacePriceMedian = value;

  List<String>? _date;
  List<String>? get date => _date;
  set date(List<String>? value) => _date = value;

  List<String>? _auctionPriceAnalysis;
  List<String>? get auctionPriceAnalysis => _auctionPriceAnalysis;
  set auctionPriceAnalysis(List<String>? value) =>
      _auctionPriceAnalysis = value;

  static PriceAnalysisExcludedFieldsStruct fromMap(Map<String, dynamic> data) {
    return PriceAnalysisExcludedFieldsStruct(
      auctionPriceMedian: (data['auctionPriceMedian'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      marketPlacePriceMedian: (data['marketPlacePriceMedian'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      date: (data['date'] as List<dynamic>?)?.map((e) => e as String).toList(),
      auctionPriceAnalysis: (data['auctionPriceAnalysis'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  static PriceAnalysisExcludedFieldsStruct? maybeFromMap(dynamic data) => data
          is Map
      ? PriceAnalysisExcludedFieldsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'auctionPriceMedian': auctionPriceMedian,
        'marketPlacePriceMedian': marketPlacePriceMedian,
        'date': date,
        'auctionPriceAnalysis': auctionPriceAnalysis,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'auctionPriceMedian':
            serializeParam(auctionPriceMedian, ParamType.String, isList: true),
        'marketPlacePriceMedian': serializeParam(
            marketPlacePriceMedian, ParamType.String,
            isList: true),
        'date': serializeParam(date, ParamType.String, isList: true),
        'auctionPriceAnalysis': serializeParam(
            auctionPriceAnalysis, ParamType.String,
            isList: true),
      }.withoutNulls;

  static PriceAnalysisExcludedFieldsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PriceAnalysisExcludedFieldsStruct(
        auctionPriceMedian: deserializeParam(
            data['auctionPriceMedian'], ParamType.String, true),
        marketPlacePriceMedian: deserializeParam(
            data['marketPlacePriceMedian'], ParamType.String, true),
        date: deserializeParam(data['date'], ParamType.String, true),
        auctionPriceAnalysis: deserializeParam(
            data['auctionPriceAnalysis'], ParamType.String, true),
      );

  @override
  String toString() => 'PriceAnalysisExcludedFieldsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PriceAnalysisExcludedFieldsStruct &&
        listEquality.equals(auctionPriceMedian, other.auctionPriceMedian) &&
        listEquality.equals(
            marketPlacePriceMedian, other.marketPlacePriceMedian) &&
        listEquality.equals(date, other.date) &&
        listEquality.equals(auctionPriceAnalysis, other.auctionPriceAnalysis);
  }

  @override
  int get hashCode => const ListEquality().hash([
        auctionPriceMedian,
        marketPlacePriceMedian,
        date,
        auctionPriceAnalysis,
      ]);
}

PriceAnalysisExcludedFieldsStruct createPriceAnalysisExcludedFieldsStruct({
  List<String>? auctionPriceMedian,
  List<String>? marketPlacePriceMedian,
  List<String>? date,
  List<String>? auctionPriceAnalysis,
}) =>
    PriceAnalysisExcludedFieldsStruct(
      auctionPriceMedian: auctionPriceMedian,
      marketPlacePriceMedian: marketPlacePriceMedian,
      date: date,
      auctionPriceAnalysis: auctionPriceAnalysis,
    );
