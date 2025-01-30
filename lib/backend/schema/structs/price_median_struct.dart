// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PriceMedianStruct extends BaseStruct {
  PriceMedianStruct(
      {num? realUsd,
      num? realHkd,
      num? realEur,
      num? realGbp,
      num? realChf,
      num? realSgd,
      num? minPriceUsd,
      num? maxPriceUsd,
      num? minPriceHkd,
      num? maxPriceHkd,
      num? minPriceEur,
      num? maxPriceEur,
      num? minPriceGbp,
      num? maxPriceGbp,
      num? minPriceChf,
      num? maxPriceChf,
      num? minPriceSgd,
      num? maxPriceSgd,
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

  num? _realUsd;
  num get realUsd => _realUsd ?? 0.0;
  set realUsd(num? value) => _realUsd = value;

  num? _realHkd;
  num get realHkd => _realHkd ?? 0.0;
  set realHkd(num? value) => _realHkd = value;

  num? _realEur;
  num get realEur => _realEur ?? 0.0;
  set realEur(num? value) => _realEur = value;

  num? _realGbp;
  num get realGbp => _realGbp ?? 0.0;
  set realGbp(num? value) => _realGbp = value;

  num? _realChf;
  num get realChf => _realChf ?? 0.0;
  set realChf(num? value) => _realChf = value;

  num? _realSgd;
  num get realSgd => _realSgd ?? 0.0;
  set realSgd(num? value) => _realSgd = value;

  num? _minPriceUsd;
  num get minPriceUsd => _minPriceUsd ?? 0.0;
  set minPriceUsd(num? value) => _minPriceUsd = value;

  num? _maxPriceUsd;
  num get maxPriceUsd => _maxPriceUsd ?? 0.0;
  set maxPriceUsd(num? value) => _maxPriceUsd = value;

  num? _minPriceHkd;
  num get minPriceHkd => _minPriceHkd ?? 0.0;
  set minPriceHkd(num? value) => _minPriceHkd = value;

  num? _maxPriceHkd;
  num get maxPriceHkd => _maxPriceHkd ?? 0.0;
  set maxPriceHkd(num? value) => _maxPriceHkd = value;

  num? _minPriceEur;
  num get minPriceEur => _minPriceEur ?? 0.0;
  set minPriceEur(num? value) => _minPriceEur = value;

  num? _maxPriceEur;
  num get maxPriceEur => _maxPriceEur ?? 0.0;
  set maxPriceEur(num? value) => _maxPriceEur = value;

  num? _minPriceGbp;
  num get minPriceGbp => _minPriceGbp ?? 0.0;
  set minPriceGbp(num? value) => _minPriceGbp = value;

  num? _maxPriceGbp;
  num get maxPriceGbp => _maxPriceGbp ?? 0.0;
  set maxPriceGbp(num? value) => _maxPriceGbp = value;

  num? _minPriceChf;
  num get minPriceChf => _minPriceChf ?? 0.0;
  set minPriceChf(num? value) => _minPriceChf = value;

  num? _maxPriceChf;
  num get maxPriceChf => _maxPriceChf ?? 0.0;
  set maxPriceChf(num? value) => _maxPriceChf = value;

  num? _minPriceSgd;
  num get minPriceSgd => _minPriceSgd ?? 0.0;
  set minPriceSgd(num? value) => _minPriceSgd = value;

  num? _maxPriceSgd;
  num get maxPriceSgd => _maxPriceSgd ?? 0.0;
  set maxPriceSgd(num? value) => _maxPriceSgd = value;

  int? _count;
  int get count => _count ?? 0;
  set count(int? value) => _count = value;

  static PriceMedianStruct fromMap(Map<String, dynamic> data) {
    return PriceMedianStruct(
      realUsd: data['realUsd'] as num?,
      realHkd: data['realHkd'] as num?,
      realEur: data['realEur'] as num?,
      realGbp: data['realGbp'] as num?,
      realChf: data['realChf'] as num?,
      realSgd: data['realSgd'] as num?,
      minPriceUsd: data['minPriceUsd'] as num?,
      maxPriceUsd: data['maxPriceUsd'] as num?,
      minPriceHkd: data['minPriceHkd'] as num?,
      maxPriceHkd: data['maxPriceHkd'] as num?,
      minPriceEur: data['minPriceEur'] as num?,
      maxPriceEur: data['maxPriceEur'] as num?,
      minPriceGbp: data['minPriceGbp'] as num?,
      maxPriceGbp: data['maxPriceGbp'] as num?,
      minPriceChf: data['minPriceChf'] as num?,
      maxPriceChf: data['maxPriceChf'] as num?,
      minPriceSgd: data['minPriceSgd'] as num?,
      maxPriceSgd: data['maxPriceSgd'] as num?,
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
        {num? realUsd,
        num? realHkd,
        num? realEur,
        num? realGbp,
        num? realChf,
        num? realSgd,
        num? minPriceUsd,
        num? maxPriceUsd,
        num? minPriceHkd,
        num? maxPriceHkd,
        num? minPriceEur,
        num? maxPriceEur,
        num? minPriceGbp,
        num? maxPriceGbp,
        num? minPriceChf,
        num? maxPriceChf,
        num? minPriceSgd,
        num? maxPriceSgd,
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
