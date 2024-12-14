// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PriceAnalysisStruct extends BaseStruct {
  PriceAnalysisStruct({
    DateTime? medianMinDate,
    DateTime? analysisMinDate,
    bool? includeCaseMaterialFilter,
    PriceMedianStruct? auctionPriceMedian,
    PriceMedianStruct? marketPlacePriceMedian,
    AuctionPriceAnalysisStruct? auctionPriceAnalysis,
    QueryStringsStruct? queryStrings,
    PriceAnalysisExcludedFieldsStruct? excludedFields,
  })  : _medianMinDate = medianMinDate,
        _analysisMinDate = analysisMinDate,
        _includeCaseMaterialFilter = includeCaseMaterialFilter,
        _auctionPriceMedian = auctionPriceMedian,
        _marketPlacePriceMedian = marketPlacePriceMedian,
        _auctionPriceAnalysis = auctionPriceAnalysis,
        _queryStrings = queryStrings,
        _excludedFields = excludedFields;

  DateTime? _medianMinDate;
  DateTime? get medianMinDate => _medianMinDate;
  set medianMinDate(DateTime? value) => _medianMinDate = value;

  DateTime? _analysisMinDate;
  DateTime? get analysisMinDate => _analysisMinDate;
  set analysisMinDate(DateTime? value) => _analysisMinDate = value;

  bool? _includeCaseMaterialFilter;
  bool? get includeCaseMaterialFilter => _includeCaseMaterialFilter;
  set includeCaseMaterialFilter(bool? value) =>
      _includeCaseMaterialFilter = value;

  PriceMedianStruct? _auctionPriceMedian;
  PriceMedianStruct? get auctionPriceMedian => _auctionPriceMedian;
  set auctionPriceMedian(PriceMedianStruct? value) =>
      _auctionPriceMedian = value;

  PriceMedianStruct? _marketPlacePriceMedian;
  PriceMedianStruct? get marketPlacePriceMedian => _marketPlacePriceMedian;
  set marketPlacePriceMedian(PriceMedianStruct? value) =>
      _marketPlacePriceMedian = value;

  AuctionPriceAnalysisStruct? _auctionPriceAnalysis;
  AuctionPriceAnalysisStruct? get auctionPriceAnalysis => _auctionPriceAnalysis;
  set auctionPriceAnalysis(AuctionPriceAnalysisStruct? value) =>
      _auctionPriceAnalysis = value;

  QueryStringsStruct? _queryStrings;
  QueryStringsStruct? get queryStrings => _queryStrings;
  set queryStrings(QueryStringsStruct? value) => _queryStrings = value;

  PriceAnalysisExcludedFieldsStruct? _excludedFields;
  PriceAnalysisExcludedFieldsStruct? get excludedFields => _excludedFields;
  set excludedFields(PriceAnalysisExcludedFieldsStruct? value) =>
      _excludedFields = value;

  static PriceAnalysisStruct fromMap(Map<String, dynamic> data) {
    return PriceAnalysisStruct(
      medianMinDate: data['medianMinDate'] != null
          ? DateTime.parse(data['medianMinDate'])
          : null,
      analysisMinDate: data['analysisMinDate'] != null
          ? DateTime.parse(data['analysisMinDate'])
          : null,
      includeCaseMaterialFilter: data['includeCaseMaterialFilter'] as bool?,
      auctionPriceMedian: data['auctionPriceMedian'] != null
          ? PriceMedianStruct.fromMap(
              data['auctionPriceMedian'] as Map<String, dynamic>)
          : null,
      marketPlacePriceMedian: data['marketPlacePriceMedian'] != null
          ? PriceMedianStruct.fromMap(
              data['marketPlacePriceMedian'] as Map<String, dynamic>)
          : null,
      auctionPriceAnalysis: data['auctionPriceAnalysis'] != null
          ? AuctionPriceAnalysisStruct.fromMap(
              data['auctionPriceAnalysis'] as Map<String, dynamic>)
          : null,
      queryStrings: data['queryStrings'] != null
          ? QueryStringsStruct.fromMap(
              data['queryStrings'] as Map<String, dynamic>)
          : null,
      excludedFields: data['excludedFields'] != null
          ? PriceAnalysisExcludedFieldsStruct.fromMap(
              data['excludedFields'] as Map<String, dynamic>)
          : null,
    );
  }

  static PriceAnalysisStruct? maybeFromMap(dynamic data) => data is Map
      ? PriceAnalysisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'medianMinDate': medianMinDate?.toIso8601String(),
        'analysisMinDate': analysisMinDate?.toIso8601String(),
        'includeCaseMaterialFilter': includeCaseMaterialFilter,
        'auctionPriceMedian': auctionPriceMedian?.toMap(),
        'marketPlacePriceMedian': marketPlacePriceMedian?.toMap(),
        'auctionPriceAnalysis': auctionPriceAnalysis?.toMap(),
        'queryStrings': queryStrings?.toMap(),
        'excludedFields': excludedFields?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'medianMinDate': serializeParam(medianMinDate, ParamType.DateTime),
        'analysisMinDate': serializeParam(analysisMinDate, ParamType.DateTime),
        'includeCaseMaterialFilter':
            serializeParam(includeCaseMaterialFilter, ParamType.bool),
        'auctionPriceMedian':
            serializeParam(auctionPriceMedian, ParamType.DataStruct),
        'marketPlacePriceMedian':
            serializeParam(marketPlacePriceMedian, ParamType.DataStruct),
        'auctionPriceAnalysis':
            serializeParam(auctionPriceAnalysis, ParamType.DataStruct),
        'queryStrings': serializeParam(queryStrings, ParamType.DataStruct),
        'excludedFields': serializeParam(excludedFields, ParamType.DataStruct),
      }.withoutNulls;

  static PriceAnalysisStruct fromSerializableMap(Map<String, dynamic> data) =>
      PriceAnalysisStruct(
        medianMinDate:
            deserializeParam(data['medianMinDate'], ParamType.DateTime, false),
        analysisMinDate: deserializeParam(
            data['analysisMinDate'], ParamType.DateTime, false),
        includeCaseMaterialFilter: deserializeParam(
            data['includeCaseMaterialFilter'], ParamType.bool, false),
        auctionPriceMedian: deserializeParam(
            data['auctionPriceMedian'], ParamType.DataStruct, false),
        marketPlacePriceMedian: deserializeParam(
            data['marketPlacePriceMedian'], ParamType.DataStruct, false),
        auctionPriceAnalysis: deserializeParam(
            data['auctionPriceAnalysis'], ParamType.DataStruct, false),
        queryStrings:
            deserializeParam(data['queryStrings'], ParamType.DataStruct, false),
        excludedFields: deserializeParam(
            data['excludedFields'], ParamType.DataStruct, false),
      );

  @override
  String toString() => 'PriceAnalysisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PriceAnalysisStruct &&
        medianMinDate == other.medianMinDate &&
        analysisMinDate == other.analysisMinDate &&
        includeCaseMaterialFilter == other.includeCaseMaterialFilter &&
        auctionPriceMedian == other.auctionPriceMedian &&
        marketPlacePriceMedian == other.marketPlacePriceMedian &&
        auctionPriceAnalysis == other.auctionPriceAnalysis &&
        queryStrings == other.queryStrings &&
        excludedFields == other.excludedFields;
  }

  @override
  int get hashCode => Object.hash(
        medianMinDate,
        analysisMinDate,
        includeCaseMaterialFilter,
        auctionPriceMedian,
        marketPlacePriceMedian,
        auctionPriceAnalysis,
        queryStrings,
        excludedFields,
      );
}

PriceAnalysisStruct createPriceAnalysisStruct({
  DateTime? medianMinDate,
  DateTime? analysisMinDate,
  bool? includeCaseMaterialFilter,
  PriceMedianStruct? auctionPriceMedian,
  PriceMedianStruct? marketPlacePriceMedian,
  AuctionPriceAnalysisStruct? auctionPriceAnalysis,
  QueryStringsStruct? queryStrings,
  PriceAnalysisExcludedFieldsStruct? excludedFields,
}) =>
    PriceAnalysisStruct(
      medianMinDate: medianMinDate,
      analysisMinDate: analysisMinDate,
      includeCaseMaterialFilter: includeCaseMaterialFilter,
      auctionPriceMedian: auctionPriceMedian,
      marketPlacePriceMedian: marketPlacePriceMedian,
      auctionPriceAnalysis: auctionPriceAnalysis,
      queryStrings: queryStrings,
      excludedFields: excludedFields,
    );
