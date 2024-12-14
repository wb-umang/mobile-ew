// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuctionPriceAnalysisStruct extends BaseStruct {
  num? _aboveEstimate;
  num? _withinEstimate;
  num? _belowEstimate;
  num? _withoutEstimate;
  num? _unsold;
  num? _unsoldRate;
  num? _totalLots;
  num? _auctionLatestSalesPriceUsd;
  num? _auctionLatestSalesPriceHkd;
  num? _auctionLatestSalesPriceEur;
  num? _auctionLatestSalesPriceGbp;
  num? _auctionLatestSalesPriceChf;
  num? _auctionLatestSalesPriceSgd;
  DateTime? _auctionLatestSalesDate;

  AuctionPriceAnalysisStruct({
    num? aboveEstimate,
    num? withinEstimate,
    num? belowEstimate,
    num? withoutEstimate,
    num? unsold,
    num? unsoldRate,
    num? totalLots,
    num? auctionLatestSalesPriceUsd,
    num? auctionLatestSalesPriceHkd,
    num? auctionLatestSalesPriceEur,
    num? auctionLatestSalesPriceGbp,
    num? auctionLatestSalesPriceChf,
    num? auctionLatestSalesPriceSgd,
    DateTime? auctionLatestSalesDate,
  })  : _aboveEstimate = aboveEstimate,
        _withinEstimate = withinEstimate,
        _belowEstimate = belowEstimate,
        _withoutEstimate = withoutEstimate,
        _unsold = unsold,
        _unsoldRate = unsoldRate,
        _totalLots = totalLots,
        _auctionLatestSalesPriceUsd = auctionLatestSalesPriceUsd,
        _auctionLatestSalesPriceHkd = auctionLatestSalesPriceHkd,
        _auctionLatestSalesPriceEur = auctionLatestSalesPriceEur,
        _auctionLatestSalesPriceGbp = auctionLatestSalesPriceGbp,
        _auctionLatestSalesPriceChf = auctionLatestSalesPriceChf,
        _auctionLatestSalesPriceSgd = auctionLatestSalesPriceSgd,
        _auctionLatestSalesDate = auctionLatestSalesDate;

  num get aboveEstimate => _aboveEstimate ?? 0.0;
  set aboveEstimate(num? value) => _aboveEstimate = value;

  num get withinEstimate => _withinEstimate ?? 0.0;
  set withinEstimate(num? value) => _withinEstimate = value;

  num get belowEstimate => _belowEstimate ?? 0.0;
  set belowEstimate(num? value) => _belowEstimate = value;

  num get withoutEstimate => _withoutEstimate ?? 0.0;
  set withoutEstimate(num? value) => _withoutEstimate = value;

  num get unsold => _unsold ?? 0.0;
  set unsold(num? value) => _unsold = value;

  num get unsoldRate => _unsoldRate ?? 0.0;
  set unsoldRate(num? value) => _unsoldRate = value;

  num get totalLots => _totalLots ?? 0.0;
  set totalLots(num? value) => _totalLots = value;

  num get auctionLatestSalesPriceUsd => _auctionLatestSalesPriceUsd ?? 0.0;
  set auctionLatestSalesPriceUsd(num? value) =>
      _auctionLatestSalesPriceUsd = value;

  num get auctionLatestSalesPriceHkd => _auctionLatestSalesPriceHkd ?? 0.0;
  set auctionLatestSalesPriceHkd(num? value) =>
      _auctionLatestSalesPriceHkd = value;

  num get auctionLatestSalesPriceEur => _auctionLatestSalesPriceEur ?? 0.0;
  set auctionLatestSalesPriceEur(num? value) =>
      _auctionLatestSalesPriceEur = value;

  num get auctionLatestSalesPriceGbp => _auctionLatestSalesPriceGbp ?? 0.0;
  set auctionLatestSalesPriceGbp(num? value) =>
      _auctionLatestSalesPriceGbp = value;

  num get auctionLatestSalesPriceChf => _auctionLatestSalesPriceChf ?? 0.0;
  set auctionLatestSalesPriceChf(num? value) =>
      _auctionLatestSalesPriceChf = value;

  num get auctionLatestSalesPriceSgd => _auctionLatestSalesPriceSgd ?? 0.0;
  set auctionLatestSalesPriceSgd(num? value) =>
      _auctionLatestSalesPriceSgd = value;

  DateTime? get auctionLatestSalesDate => _auctionLatestSalesDate;
  set auctionLatestSalesDate(DateTime? value) =>
      _auctionLatestSalesDate = value;

  // Factory method for creating an instance from a map.
  static AuctionPriceAnalysisStruct fromMap(Map<String, dynamic> map) {
    return AuctionPriceAnalysisStruct(
      aboveEstimate: map['aboveEstimate'] as num?,
      withinEstimate: map['withinEstimate'] as num?,
      belowEstimate: map['belowEstimate'] as num?,
      withoutEstimate: map['withoutEstimate'] as num?,
      unsold: map['unsold'] as num?,
      unsoldRate: map['unsoldRate'] as num?,
      totalLots: map['totalLots'] as num?,
      auctionLatestSalesPriceUsd: map['auctionLatestSalesPriceUsd'] as num?,
      auctionLatestSalesPriceHkd: map['auctionLatestSalesPriceHkd'] as num?,
      auctionLatestSalesPriceEur: map['auctionLatestSalesPriceEur'] as num?,
      auctionLatestSalesPriceGbp: map['auctionLatestSalesPriceGbp'] as num?,
      auctionLatestSalesPriceChf: map['auctionLatestSalesPriceChf'] as num?,
      auctionLatestSalesPriceSgd: map['auctionLatestSalesPriceSgd'] as num?,
      auctionLatestSalesDate: map['auctionLatestSalesDate'] != null
          ? DateTime.parse(map['auctionLatestSalesDate'])
          : null,
    );
  }

  static AuctionPriceAnalysisStruct? maybeFromMap(dynamic data) => data is Map
      ? AuctionPriceAnalysisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  // Converts this object to a map.
  Map<String, dynamic> toMap() => {
        'aboveEstimate': _aboveEstimate,
        'withinEstimate': _withinEstimate,
        'belowEstimate': _belowEstimate,
        'withoutEstimate': _withoutEstimate,
        'unsold': _unsold,
        'unsoldRate': _unsoldRate,
        'totalLots': _totalLots,
        'auctionLatestSalesPriceUsd': _auctionLatestSalesPriceUsd,
        'auctionLatestSalesPriceHkd': _auctionLatestSalesPriceHkd,
        'auctionLatestSalesPriceEur': _auctionLatestSalesPriceEur,
        'auctionLatestSalesPriceGbp': _auctionLatestSalesPriceGbp,
        'auctionLatestSalesPriceChf': _auctionLatestSalesPriceChf,
        'auctionLatestSalesPriceSgd': _auctionLatestSalesPriceSgd,
        'auctionLatestSalesDate': _auctionLatestSalesDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'aboveEstimate': serializeParam(_aboveEstimate, ParamType.double),
        'withinEstimate': serializeParam(_withinEstimate, ParamType.double),
        'belowEstimate': serializeParam(_belowEstimate, ParamType.double),
        'withoutEstimate': serializeParam(_withoutEstimate, ParamType.double),
        'unsold': serializeParam(_unsold, ParamType.double),
        'unsoldRate': serializeParam(_unsoldRate, ParamType.double),
        'totalLots': serializeParam(_totalLots, ParamType.double),
        'auctionLatestSalesPriceUsd':
            serializeParam(_auctionLatestSalesPriceUsd, ParamType.double),
        'auctionLatestSalesPriceHkd':
            serializeParam(_auctionLatestSalesPriceHkd, ParamType.double),
        'auctionLatestSalesPriceEur':
            serializeParam(_auctionLatestSalesPriceEur, ParamType.double),
        'auctionLatestSalesPriceGbp':
            serializeParam(_auctionLatestSalesPriceGbp, ParamType.double),
        'auctionLatestSalesPriceChf':
            serializeParam(_auctionLatestSalesPriceChf, ParamType.double),
        'auctionLatestSalesPriceSgd':
            serializeParam(_auctionLatestSalesPriceSgd, ParamType.double),
        'auctionLatestSalesDate':
            serializeParam(_auctionLatestSalesDate, ParamType.String),
      }.withoutNulls;

  static AuctionPriceAnalysisStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AuctionPriceAnalysisStruct(
          aboveEstimate:
              deserializeParam(data['aboveEstimate'], ParamType.double, false),
          withinEstimate:
              deserializeParam(data['withinEstimate'], ParamType.double, false),
          belowEstimate:
              deserializeParam(data['belowEstimate'], ParamType.double, false),
          withoutEstimate: deserializeParam(
              data['withoutEstimate'], ParamType.double, false),
          unsold: deserializeParam(data['unsold'], ParamType.double, false),
          unsoldRate:
              deserializeParam(data['unsoldRate'], ParamType.double, false),
          totalLots:
              deserializeParam(data['totalLots'], ParamType.double, false),
          auctionLatestSalesPriceUsd: deserializeParam(
              data['auctionLatestSalesPriceUsd'], ParamType.double, false),
          auctionLatestSalesPriceHkd: deserializeParam(
              data['auctionLatestSalesPriceHkd'], ParamType.double, false),
          auctionLatestSalesPriceEur: deserializeParam(
              data['auctionLatestSalesPriceEur'], ParamType.double, false),
          auctionLatestSalesPriceGbp: deserializeParam(
              data['auctionLatestSalesPriceGbp'], ParamType.double, false),
          auctionLatestSalesPriceChf: deserializeParam(
              data['auctionLatestSalesPriceChf'], ParamType.double, false),
          auctionLatestSalesPriceSgd: deserializeParam(
              data['auctionLatestSalesPriceSgd'], ParamType.double, false),
          auctionLatestSalesDate: deserializeParam(
              data['auctionLatestSalesDate'], ParamType.String, false));

  @override
  String toString() => 'AuctionPriceAnalysisStruct(${toMap()})';

  // Equality and hashCode methods
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuctionPriceAnalysisStruct &&
        other._aboveEstimate == _aboveEstimate &&
        other._withinEstimate == _withinEstimate &&
        other._belowEstimate == _belowEstimate &&
        other._withoutEstimate == _withoutEstimate &&
        other._unsold == _unsold &&
        other._unsoldRate == _unsoldRate &&
        other._totalLots == _totalLots &&
        other._auctionLatestSalesPriceUsd == _auctionLatestSalesPriceUsd &&
        other._auctionLatestSalesPriceHkd == _auctionLatestSalesPriceHkd &&
        other._auctionLatestSalesPriceEur == _auctionLatestSalesPriceEur &&
        other._auctionLatestSalesPriceGbp == _auctionLatestSalesPriceGbp &&
        other._auctionLatestSalesPriceChf == _auctionLatestSalesPriceChf &&
        other._auctionLatestSalesPriceSgd == _auctionLatestSalesPriceSgd &&
        other._auctionLatestSalesDate == _auctionLatestSalesDate;
  }

  @override
  int get hashCode => Object.hash(
        _aboveEstimate,
        _withinEstimate,
        _belowEstimate,
        _withoutEstimate,
        _unsold,
        _unsoldRate,
        _totalLots,
        _auctionLatestSalesPriceUsd,
        _auctionLatestSalesPriceHkd,
        _auctionLatestSalesPriceEur,
        _auctionLatestSalesPriceGbp,
        _auctionLatestSalesPriceChf,
        _auctionLatestSalesPriceSgd,
        _auctionLatestSalesDate,
      );
}

AuctionPriceAnalysisStruct createAuctionPriceAnalysisStruct({
  num? aboveEstimate,
  num? withinEstimate,
  num? belowEstimate,
  num? withoutEstimate,
  num? unsold,
  num? unsoldRate,
  num? totalLots,
  num? auctionLatestSalesPriceUsd,
  num? auctionLatestSalesPriceHkd,
  num? auctionLatestSalesPriceEur,
  num? auctionLatestSalesPriceGbp,
  num? auctionLatestSalesPriceChf,
  num? auctionLatestSalesPriceSgd,
  DateTime? auctionLatestSalesDate,
}) {
  return AuctionPriceAnalysisStruct(
    aboveEstimate: aboveEstimate,
    withinEstimate: withinEstimate,
    belowEstimate: belowEstimate,
    withoutEstimate: withoutEstimate,
    unsold: unsold,
    unsoldRate: unsoldRate,
    totalLots: totalLots,
    auctionLatestSalesPriceUsd: auctionLatestSalesPriceUsd,
    auctionLatestSalesPriceHkd: auctionLatestSalesPriceHkd,
    auctionLatestSalesPriceEur: auctionLatestSalesPriceEur,
    auctionLatestSalesPriceGbp: auctionLatestSalesPriceGbp,
    auctionLatestSalesPriceChf: auctionLatestSalesPriceChf,
    auctionLatestSalesPriceSgd: auctionLatestSalesPriceSgd,
    auctionLatestSalesDate: auctionLatestSalesDate,
  );
}
