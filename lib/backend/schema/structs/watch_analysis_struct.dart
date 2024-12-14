// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchAnalysisStruct extends BaseStruct {
  WatchAnalysisStruct({
    PriceAnalysisStruct? manufacturerPriceAnalysis,
    PriceAnalysisStruct? modelPriceAnalysis,
    PriceAnalysisStruct? referenceNumberPriceAnalysis,
  })  : _manufacturerPriceAnalysis = manufacturerPriceAnalysis,
        _modelPriceAnalysis = modelPriceAnalysis,
        _referenceNumberPriceAnalysis = referenceNumberPriceAnalysis;

  PriceAnalysisStruct? _manufacturerPriceAnalysis;
  PriceAnalysisStruct? get manufacturerPriceAnalysis =>
      _manufacturerPriceAnalysis;
  set manufacturerPriceAnalysis(PriceAnalysisStruct? value) =>
      _manufacturerPriceAnalysis = value;

  PriceAnalysisStruct? _modelPriceAnalysis;
  PriceAnalysisStruct? get modelPriceAnalysis => _modelPriceAnalysis;
  set modelPriceAnalysis(PriceAnalysisStruct? value) =>
      _modelPriceAnalysis = value;

  PriceAnalysisStruct? _referenceNumberPriceAnalysis;
  PriceAnalysisStruct? get referenceNumberPriceAnalysis =>
      _referenceNumberPriceAnalysis;
  set referenceNumberPriceAnalysis(PriceAnalysisStruct? value) =>
      _referenceNumberPriceAnalysis = value;

  static WatchAnalysisStruct fromMap(Map<String, dynamic> data) {
    return WatchAnalysisStruct(
      manufacturerPriceAnalysis:
          PriceAnalysisStruct.maybeFromMap(data['manufacturerPriceAnalysis']),
      modelPriceAnalysis:
          PriceAnalysisStruct.maybeFromMap(data['modelPriceAnalysis']),
      referenceNumberPriceAnalysis: PriceAnalysisStruct.maybeFromMap(
          data['referenceNumberPriceAnalysis']),
    );
  }

  static WatchAnalysisStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchAnalysisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'manufacturerPriceAnalysis': manufacturerPriceAnalysis?.toMap(),
        'modelPriceAnalysis': modelPriceAnalysis?.toMap(),
        'referenceNumberPriceAnalysis': referenceNumberPriceAnalysis?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'manufacturerPriceAnalysis':
            serializeParam(manufacturerPriceAnalysis, ParamType.DataStruct),
        'modelPriceAnalysis':
            serializeParam(modelPriceAnalysis, ParamType.DataStruct),
        'referenceNumberPriceAnalysis':
            serializeParam(referenceNumberPriceAnalysis, ParamType.DataStruct),
      }.withoutNulls;

  static WatchAnalysisStruct fromSerializableMap(Map<String, dynamic> data) =>
      WatchAnalysisStruct(
        manufacturerPriceAnalysis: deserializeParam(
            data['manufacturerPriceAnalysis'], ParamType.DataStruct, false),
        modelPriceAnalysis: deserializeParam(
            data['modelPriceAnalysis'], ParamType.DataStruct, false),
        referenceNumberPriceAnalysis: deserializeParam(
            data['referenceNumberPriceAnalysis'], ParamType.DataStruct, false),
      );

  @override
  String toString() => 'WatchAnalysisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchAnalysisStruct &&
        manufacturerPriceAnalysis == other.manufacturerPriceAnalysis &&
        modelPriceAnalysis == other.modelPriceAnalysis &&
        referenceNumberPriceAnalysis == other.referenceNumberPriceAnalysis;
  }

  @override
  int get hashCode => Object.hash(
        manufacturerPriceAnalysis,
        modelPriceAnalysis,
        referenceNumberPriceAnalysis,
      );
}

WatchAnalysisStruct createWatchAnalysisStruct({
  PriceAnalysisStruct? manufacturerPriceAnalysis,
  PriceAnalysisStruct? modelPriceAnalysis,
  PriceAnalysisStruct? referenceNumberPriceAnalysis,
}) =>
    WatchAnalysisStruct(
      manufacturerPriceAnalysis: manufacturerPriceAnalysis,
      modelPriceAnalysis: modelPriceAnalysis,
      referenceNumberPriceAnalysis: referenceNumberPriceAnalysis,
    );
