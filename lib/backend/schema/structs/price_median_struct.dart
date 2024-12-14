// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PriceMedianStruct extends BaseStruct {
  PriceMedianStruct(
      {double? realUsd,
      double? realHkd,
      double? realEur,
      double? realGbp,
      double? realChf,
      double? realSgd,
      double? minPriceUsd,
      double? maxPriceUsd,
      double? minPriceHkd,
      double? maxPriceHkd,
      double? minPriceEur,
      double? maxPriceEur,
      double? minPriceGbp,
      double? maxPriceGbp,
      double? minPriceChf,
      double? maxPriceChf,
      double? minPriceSgd,
      double? maxPriceSgd,
      int? count})
      : _realUsd = realUsd,
        _realHkd = realHkd,
        _realEur = realEur,
        _realGbp = realGbp,
        _realChf = realChf,
        _realSgd = realSgd,
        _minPriceUsd = minPriceUsd,
        _maxPriceUsd = maxPriceUsd,
        _minPriceHkd = minPriceHkd,
        _maxPriceHkd = maxPriceHkd,
        _minPriceEur = minPriceEur,
        _maxPriceEur = maxPriceEur,
        _minPriceGbp = minPriceGbp,
        _maxPriceGbp = maxPriceGbp,
        _minPriceChf = minPriceChf,
        _maxPriceChf = maxPriceChf,
        _minPriceSgd = minPriceSgd,
        _maxPriceSgd = maxPriceSgd,
        _count = count;

  double? _realUsd;
  double get realUsd => _realUsd ?? 0.0;
  set realUsd(double? value) => _realUsd = value;

  double? _realHkd;
  double get realHkd => _realHkd ?? 0.0;
  set realHkd(double? value) => _realHkd = value;

  double? _realEur;
  double get realEur => _realEur ?? 0.0;
  set realEur(double? value) => _realEur = value;

  double? _realGbp;
  double get realGbp => _realGbp ?? 0.0;
  set realGbp(double? value) => _realGbp = value;

  double? _realChf;
  double get realChf => _realChf ?? 0.0;
  set realChf(double? value) => _realChf = value;

  double? _realSgd;
  double get realSgd => _realSgd ?? 0.0;
  set realSgd(double? value) => _realSgd = value;

  double? _minPriceUsd;
  double get minPriceUsd => _minPriceUsd ?? 0.0;
  set minPriceUsd(double? value) => _minPriceUsd = value;

  double? _maxPriceUsd;
  double get maxPriceUsd => _maxPriceUsd ?? 0.0;
  set maxPriceUsd(double? value) => _maxPriceUsd = value;

  double? _minPriceHkd;
  double get minPriceHkd => _minPriceHkd ?? 0.0;
  set minPriceHkd(double? value) => _minPriceHkd = value;

  double? _maxPriceHkd;
  double get maxPriceHkd => _maxPriceHkd ?? 0.0;
  set maxPriceHkd(double? value) => _maxPriceHkd = value;

  double? _minPriceEur;
  double get minPriceEur => _minPriceEur ?? 0.0;
  set minPriceEur(double? value) => _minPriceEur = value;

  double? _maxPriceEur;
  double get maxPriceEur => _maxPriceEur ?? 0.0;
  set maxPriceEur(double? value) => _maxPriceEur = value;

  double? _minPriceGbp;
  double get minPriceGbp => _minPriceGbp ?? 0.0;
  set minPriceGbp(double? value) => _minPriceGbp = value;

  double? _maxPriceGbp;
  double get maxPriceGbp => _maxPriceGbp ?? 0.0;
  set maxPriceGbp(double? value) => _maxPriceGbp = value;

  double? _minPriceChf;
  double get minPriceChf => _minPriceChf ?? 0.0;
  set minPriceChf(double? value) => _minPriceChf = value;

  double? _maxPriceChf;
  double get maxPriceChf => _maxPriceChf ?? 0.0;
  set maxPriceChf(double? value) => _maxPriceChf = value;

  double? _minPriceSgd;
  double get minPriceSgd => _minPriceSgd ?? 0.0;
  set minPriceSgd(double? value) => _minPriceSgd = value;

  double? _maxPriceSgd;
  double get maxPriceSgd => _maxPriceSgd ?? 0.0;
  set maxPriceSgd(double? value) => _maxPriceSgd = value;

  int? _count;
  int get count => _count ?? 0;
  set count(int? value) => _count = value;

  static PriceMedianStruct fromMap(Map<String, dynamic> data) {
    return PriceMedianStruct(
      realUsd: data['realUsd'] as double?,
      realHkd: data['realHkd'] as double?,
      realEur: data['realEur'] as double?,
      realGbp: data['realGbp'] as double?,
      realChf: data['realChf'] as double?,
      realSgd: data['realSgd'] as double?,
      minPriceUsd: data['minPriceUsd'] as double?,
      maxPriceUsd: data['maxPriceUsd'] as double?,
      minPriceHkd: data['minPriceHkd'] as double?,
      maxPriceHkd: data['maxPriceHkd'] as double?,
      minPriceEur: data['minPriceEur'] as double?,
      maxPriceEur: data['maxPriceEur'] as double?,
      minPriceGbp: data['minPriceGbp'] as double?,
      maxPriceGbp: data['maxPriceGbp'] as double?,
      minPriceChf: data['minPriceChf'] as double?,
      maxPriceChf: data['maxPriceChf'] as double?,
      minPriceSgd: data['minPriceSgd'] as double?,
      maxPriceSgd: data['maxPriceSgd'] as double?,
      count: data['count'] as int?,
    );
  }

  static PriceMedianStruct? maybeFromMap(dynamic data) => data is Map
      ? PriceMedianStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'realUsd': realUsd,
        'realHkd': realHkd,
        'realEur': realEur,
        'realGbp': realGbp,
        'realChf': realChf,
        'realSgd': realSgd,
        'minPriceUsd': minPriceUsd,
        'maxPriceUsd': maxPriceUsd,
        'minPriceHkd': minPriceHkd,
        'maxPriceHkd': maxPriceHkd,
        'minPriceEur': minPriceEur,
        'maxPriceEur': maxPriceEur,
        'minPriceGbp': minPriceGbp,
        'maxPriceGbp': maxPriceGbp,
        'minPriceChf': minPriceChf,
        'maxPriceChf': maxPriceChf,
        'minPriceSgd': minPriceSgd,
        'maxPriceSgd': maxPriceSgd,
        'count': count
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'realUsd': serializeParam(realUsd, ParamType.double),
        'realHkd': serializeParam(realHkd, ParamType.double),
        'realEur': serializeParam(realEur, ParamType.double),
        'realGbp': serializeParam(realGbp, ParamType.double),
        'realChf': serializeParam(realChf, ParamType.double),
        'realSgd': serializeParam(realSgd, ParamType.double),
        'minPriceUsd': serializeParam(minPriceUsd, ParamType.double),
        'maxPriceUsd': serializeParam(maxPriceUsd, ParamType.double),
        'minPriceHkd': serializeParam(minPriceHkd, ParamType.double),
        'maxPriceHkd': serializeParam(maxPriceHkd, ParamType.double),
        'minPriceEur': serializeParam(minPriceEur, ParamType.double),
        'maxPriceEur': serializeParam(maxPriceEur, ParamType.double),
        'minPriceGbp': serializeParam(minPriceGbp, ParamType.double),
        'maxPriceGbp': serializeParam(maxPriceGbp, ParamType.double),
        'minPriceChf': serializeParam(minPriceChf, ParamType.double),
        'maxPriceChf': serializeParam(maxPriceChf, ParamType.double),
        'minPriceSgd': serializeParam(minPriceSgd, ParamType.double),
        'maxPriceSgd': serializeParam(maxPriceSgd, ParamType.double),
        'count': serializeParam(count, ParamType.int),
      }.withoutNulls;

  static PriceMedianStruct fromSerializableMap(Map<String, dynamic> data) =>
      PriceMedianStruct(
          realUsd: deserializeParam(data['realUsd'], ParamType.double, false),
          realHkd: deserializeParam(data['realHkd'], ParamType.double, false),
          realEur: deserializeParam(data['realEur'], ParamType.double, false),
          realGbp: deserializeParam(data['realGbp'], ParamType.double, false),
          realChf: deserializeParam(data['realChf'], ParamType.double, false),
          realSgd: deserializeParam(data['realSgd'], ParamType.double, false),
          minPriceUsd:
              deserializeParam(data['minPriceUsd'], ParamType.double, false),
          maxPriceUsd:
              deserializeParam(data['maxPriceUsd'], ParamType.double, false),
          minPriceHkd:
              deserializeParam(data['minPriceHkd'], ParamType.double, false),
          maxPriceHkd:
              deserializeParam(data['maxPriceHkd'], ParamType.double, false),
          minPriceEur:
              deserializeParam(data['minPriceEur'], ParamType.double, false),
          maxPriceEur:
              deserializeParam(data['maxPriceEur'], ParamType.double, false),
          minPriceGbp:
              deserializeParam(data['minPriceGbp'], ParamType.double, false),
          maxPriceGbp:
              deserializeParam(data['maxPriceGbp'], ParamType.double, false),
          minPriceChf:
              deserializeParam(data['minPriceChf'], ParamType.double, false),
          maxPriceChf:
              deserializeParam(data['maxPriceChf'], ParamType.double, false),
          minPriceSgd:
              deserializeParam(data['minPriceSgd'], ParamType.double, false),
          maxPriceSgd:
              deserializeParam(data['maxPriceSgd'], ParamType.double, false),
          count: deserializeParam(data['count'], ParamType.int, false));

  @override
  String toString() => 'PriceMedianStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PriceMedianStruct &&
        realUsd == other.realUsd &&
        realHkd == other.realHkd &&
        realEur == other.realEur &&
        realGbp == other.realGbp &&
        realChf == other.realChf &&
        realSgd == other.realSgd &&
        minPriceUsd == other.minPriceUsd &&
        maxPriceUsd == other.maxPriceUsd &&
        minPriceHkd == other.minPriceHkd &&
        maxPriceHkd == other.maxPriceHkd &&
        minPriceEur == other.minPriceEur &&
        maxPriceEur == other.maxPriceEur &&
        minPriceGbp == other.minPriceGbp &&
        maxPriceGbp == other.maxPriceGbp &&
        minPriceChf == other.minPriceChf &&
        maxPriceChf == other.maxPriceChf &&
        minPriceSgd == other.minPriceSgd &&
        maxPriceSgd == other.maxPriceSgd &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([
        realUsd,
        realHkd,
        realEur,
        realGbp,
        realChf,
        realSgd,
        minPriceUsd,
        maxPriceUsd,
        minPriceHkd,
        maxPriceHkd,
        minPriceEur,
        maxPriceEur,
        minPriceGbp,
        maxPriceGbp,
        minPriceChf,
        maxPriceChf,
        minPriceSgd,
        maxPriceSgd,
        count
      ]);
}

PriceMedianStruct createPriceMedianStruct(
        {double? realUsd,
        double? realHkd,
        double? realEur,
        double? realGbp,
        double? realChf,
        double? realSgd,
        double? minPriceUsd,
        double? maxPriceUsd,
        double? minPriceHkd,
        double? maxPriceHkd,
        double? minPriceEur,
        double? maxPriceEur,
        double? minPriceGbp,
        double? maxPriceGbp,
        double? minPriceChf,
        double? maxPriceChf,
        double? minPriceSgd,
        double? maxPriceSgd,
        int? count}) =>
    PriceMedianStruct(
        realUsd: realUsd,
        realHkd: realHkd,
        realEur: realEur,
        realGbp: realGbp,
        realChf: realChf,
        realSgd: realSgd,
        minPriceUsd: minPriceUsd,
        maxPriceUsd: maxPriceUsd,
        minPriceHkd: minPriceHkd,
        maxPriceHkd: maxPriceHkd,
        minPriceEur: minPriceEur,
        maxPriceEur: maxPriceEur,
        minPriceGbp: minPriceGbp,
        maxPriceGbp: maxPriceGbp,
        minPriceChf: minPriceChf,
        maxPriceChf: maxPriceChf,
        minPriceSgd: minPriceSgd,
        maxPriceSgd: maxPriceSgd,
        count: count);
