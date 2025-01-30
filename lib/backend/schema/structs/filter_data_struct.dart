// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterDataStruct extends BaseStruct {
  FilterDataStruct({
    String? currencyMode,
    List<String>? auctionType,
    List<String>? manufacturer,
    List<String>? model,
    List<String>? referenceNumber,
    List<String>? caseSize,
    List<String>? caseMaterial,
    List<String>? dialColor,
    List<String>? movement,
    List<String>? braceletMaterial,
    List<String>? claspMaterial,
    List<String>? infoSource,
    List<String>? country,
    List<String>? condition,
  })  : _currencyMode = currencyMode,
        _auctionType = auctionType,
        _manufacturer = manufacturer,
        _model = model,
        _referenceNumber = referenceNumber,
        _caseSize = caseSize,
        _caseMaterial = caseMaterial,
        _dialColor = dialColor,
        _movement = movement,
        _braceletMaterial = braceletMaterial,
        _claspMaterial = claspMaterial,
        _infoSource = infoSource,
        _country = country,
        _condition = condition;

  // "currencyMode" field.
  String? _currencyMode;
  String get currencyMode => _currencyMode ?? 'USD';
  set currencyMode(String? val) => _currencyMode = val;

  bool hasCurrencyMode() => _currencyMode != null;

  // "auctionType" field.
  List<String>? _auctionType;
  List<String> get auctionType => _auctionType ?? [];
  set auctionType(List<String>? val) => _auctionType = val;

  void updateAuctionType(Function(List<String>) updateFn) {
    updateFn(_auctionType ??= []);
  }

  bool hasAuctionType() => _auctionType != null;

  // "manufacturer" field.
  List<String>? _manufacturer;
  List<String> get manufacturer => _manufacturer ?? [];
  set manufacturer(List<String>? val) => _manufacturer = val;

  void updateManufacturer(Function(List<String>) updateFn) {
    updateFn(_manufacturer ??= []);
  }

  bool hasManufacturer() => _manufacturer != null;

  // "model" field.
  List<String>? _model;
  List<String> get model => _model ?? [];
  set model(List<String>? val) => _model = val;

  void updateModel(Function(List<String>) updateFn) {
    updateFn(_model ??= []);
  }

  bool hasModel() => _model != null;

  // "referenceNumber" field.
  List<String>? _referenceNumber;
  List<String> get referenceNumber => _referenceNumber ?? [];
  set referenceNumber(List<String>? val) => _referenceNumber = val;

  void updateReferenceNumber(Function(List<String>) updateFn) {
    updateFn(_referenceNumber ??= []);
  }

  bool hasReferenceNumber() => _referenceNumber != null;

  // "caseSize" field.
  List<String>? _caseSize;
  List<String> get caseSize => _caseSize ?? [];
  set caseSize(List<String>? val) => _caseSize = val;

  void updateCaseSize(Function(List<String>) updateFn) {
    updateFn(_caseSize ??= []);
  }

  bool hasCaseSize() => _caseSize != null;

  // "caseMaterial" field.
  List<String>? _caseMaterial;
  List<String> get caseMaterial => _caseMaterial ?? [];
  set caseMaterial(List<String>? val) => _caseMaterial = val;

  void updateCaseMaterial(Function(List<String>) updateFn) {
    updateFn(_caseMaterial ??= []);
  }

  bool hasCaseMaterial() => _caseMaterial != null;

  // "dialColor" field.
  List<String>? _dialColor;
  List<String> get dialColor => _dialColor ?? [];
  set dialColor(List<String>? val) => _dialColor = val;

  void updateDialColor(Function(List<String>) updateFn) {
    updateFn(_dialColor ??= []);
  }

  bool hasDialColor() => _dialColor != null;

  // "movement" field.
  List<String>? _movement;
  List<String> get movement => _movement ?? [];
  set movement(List<String>? val) => _movement = val;

  void updateMovement(Function(List<String>) updateFn) {
    updateFn(_movement ??= []);
  }

  bool hasMovement() => _movement != null;

  // "braceletMaterial" field.
  List<String>? _braceletMaterial;
  List<String> get braceletMaterial => _braceletMaterial ?? [];
  set braceletMaterial(List<String>? val) => _braceletMaterial = val;

  void updateBraceletMaterial(Function(List<String>) updateFn) {
    updateFn(_braceletMaterial ??= []);
  }

  bool hasBraceletMaterial() => _braceletMaterial != null;

  // "claspMaterial" field.
  List<String>? _claspMaterial;
  List<String> get claspMaterial => _claspMaterial ?? [];
  set claspMaterial(List<String>? val) => _claspMaterial = val;

  void updateClaspMaterial(Function(List<String>) updateFn) {
    updateFn(_claspMaterial ??= []);
  }

  bool hasClaspMaterial() => _claspMaterial != null;

  // "infoSource" field.
  List<String>? _infoSource;
  List<String> get infoSource => _infoSource ?? [];
  set infoSource(List<String>? val) => _infoSource = val;

  void updateInfoSource(Function(List<String>) updateFn) {
    updateFn(_infoSource ??= []);
  }

  bool hasInfoSource() => _infoSource != null;

  // "country" field.
  List<String>? _country;
  List<String> get country => _country ?? [];
  set country(List<String>? val) => _country = val;

  void updateCountry(Function(List<String>) updateFn) {
    updateFn(_country ??= []);
  }

  bool hasCountry() => _country != null;

  // "condition" field.
  List<String>? _condition;
  List<String> get condition => _condition ?? [];
  set condition(List<String>? val) => _condition = val;

  void updateCondition(Function(List<String>) updateFn) {
    updateFn(_condition ??= []);
  }

  bool hasCondition() => _condition != null;

  static FilterDataStruct fromMap(Map<String, dynamic> data) =>
      FilterDataStruct(
        currencyMode: data['currencyMode'] as String?,
        auctionType: getDataList(data['auctionType']),
        manufacturer: getDataList(data['manufacturer']),
        model: getDataList(data['model']),
        referenceNumber: getDataList(data['referenceNumber']),
        caseSize: getDataList(data['caseSize']),
        caseMaterial: getDataList(data['caseMaterial']),
        dialColor: getDataList(data['dialColor']),
        movement: getDataList(data['movement']),
        braceletMaterial: getDataList(data['braceletMaterial']),
        claspMaterial: getDataList(data['claspMaterial']),
        infoSource: getDataList(data['infoSource']),
        country: getDataList(data['country']),
        condition: getDataList(data['condition']),
      );

  static FilterDataStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'currencyMode': _currencyMode,
        'auctionType': _auctionType,
        'manufacturer': _manufacturer,
        'model': _model,
        'referenceNumber': _referenceNumber,
        'caseSize': _caseSize,
        'caseMaterial': _caseMaterial,
        'dialColor': _dialColor,
        'movement': _movement,
        'braceletMaterial': _braceletMaterial,
        'claspMaterial': _claspMaterial,
        'infoSource': _infoSource,
        'country': _country,
        'condition': _condition,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'currencyMode': serializeParam(
          _currencyMode,
          ParamType.String,
        ),
        'auctionType': serializeParam(
          _auctionType,
          ParamType.String,
          isList: true,
        ),
        'manufacturer': serializeParam(
          _manufacturer,
          ParamType.String,
          isList: true,
        ),
        'model': serializeParam(
          _model,
          ParamType.String,
          isList: true,
        ),
        'referenceNumber': serializeParam(
          _referenceNumber,
          ParamType.String,
          isList: true,
        ),
        'caseSize': serializeParam(
          _caseSize,
          ParamType.String,
          isList: true,
        ),
        'caseMaterial': serializeParam(
          _caseMaterial,
          ParamType.String,
          isList: true,
        ),
        'dialColor': serializeParam(
          _dialColor,
          ParamType.String,
          isList: true,
        ),
        'movement': serializeParam(
          _movement,
          ParamType.String,
          isList: true,
        ),
        'braceletMaterial': serializeParam(
          _braceletMaterial,
          ParamType.String,
          isList: true,
        ),
        'claspMaterial': serializeParam(
          _claspMaterial,
          ParamType.String,
          isList: true,
        ),
        'infoSource': serializeParam(
          _infoSource,
          ParamType.String,
          isList: true,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
          isList: true,
        ),
        'condition': serializeParam(
          _condition,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static FilterDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilterDataStruct(
        currencyMode: deserializeParam(
          data['currencyMode'],
          ParamType.String,
          false,
        ),
        auctionType: deserializeParam<String>(
          data['auctionType'],
          ParamType.String,
          true,
        ),
        manufacturer: deserializeParam<String>(
          data['manufacturer'],
          ParamType.String,
          true,
        ),
        model: deserializeParam<String>(
          data['model'],
          ParamType.String,
          true,
        ),
        referenceNumber: deserializeParam<String>(
          data['referenceNumber'],
          ParamType.String,
          true,
        ),
        caseSize: deserializeParam<String>(
          data['caseSize'],
          ParamType.String,
          true,
        ),
        caseMaterial: deserializeParam<String>(
          data['caseMaterial'],
          ParamType.String,
          true,
        ),
        dialColor: deserializeParam<String>(
          data['dialColor'],
          ParamType.String,
          true,
        ),
        movement: deserializeParam<String>(
          data['movement'],
          ParamType.String,
          true,
        ),
        braceletMaterial: deserializeParam<String>(
          data['braceletMaterial'],
          ParamType.String,
          true,
        ),
        claspMaterial: deserializeParam<String>(
          data['claspMaterial'],
          ParamType.String,
          true,
        ),
        infoSource: deserializeParam<String>(
          data['infoSource'],
          ParamType.String,
          true,
        ),
        country: deserializeParam<String>(
          data['country'],
          ParamType.String,
          true,
        ),
        condition: deserializeParam<String>(
          data['condition'],
          ParamType.String,
          true,
        ),
      );

  static FilterDataStruct parseFilterData(String query) {
    Map<String, List<String>> params = {};

    // Split the query string by '&' to get each parameter
    query.split('&').forEach((param) {
      var parts = param.split('=');
      if (parts.length == 2) {
        params[parts[0]] = (params[parts[0]] ?? [])..add(parts[1]);
      }
    });

    return FilterDataStruct(
      manufacturer: params['manufacturer'],
      model: params['model'],
      referenceNumber: params['referenceNumber'],
      caseSize: params['caseSize'],
      caseMaterial: params['caseMaterial'],
      dialColor: params['dialColor'],
      movement: params['movement'],
      braceletMaterial: params['braceletMaterial'],
      claspMaterial: params['claspMaterial'],
      infoSource: params['infoSource'],
      country: params['country'],
      condition: params['condition'],
    );
  }

  static FilterDataStruct createEmptyFilterDataStruct(
          {String? currencyMode, List<String>? auctionType}) =>
      FilterDataStruct(currencyMode: currencyMode, auctionType: auctionType);

  @override
  String toString() => 'FilterDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FilterDataStruct &&
        currencyMode == other.currencyMode &&
        listEquality.equals(auctionType, other.auctionType) &&
        listEquality.equals(manufacturer, other.manufacturer) &&
        listEquality.equals(model, other.model) &&
        listEquality.equals(referenceNumber, other.referenceNumber) &&
        listEquality.equals(caseSize, other.caseSize) &&
        listEquality.equals(caseMaterial, other.caseMaterial) &&
        listEquality.equals(dialColor, other.dialColor) &&
        listEquality.equals(movement, other.movement) &&
        listEquality.equals(braceletMaterial, other.braceletMaterial) &&
        listEquality.equals(claspMaterial, other.claspMaterial) &&
        listEquality.equals(infoSource, other.infoSource) &&
        listEquality.equals(country, other.country) &&
        listEquality.equals(condition, other.condition);
  }

  @override
  int get hashCode => const ListEquality().hash([
        currencyMode,
        auctionType,
        manufacturer,
        model,
        referenceNumber,
        caseSize,
        caseMaterial,
        dialColor,
        movement,
        braceletMaterial,
        claspMaterial,
        infoSource,
        country,
        condition,
      ]);
}
