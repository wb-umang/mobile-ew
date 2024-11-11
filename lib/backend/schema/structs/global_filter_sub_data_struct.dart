// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlobalFilterSubDataStruct extends BaseStruct {
  GlobalFilterSubDataStruct({
    List<GlobalFilterStruct>? manufacturer,
    List<GlobalFilterStruct>? model,
    List<GlobalFilterStruct>? referenceNumber,
    List<GlobalFilterStruct>? caseSize,
    List<GlobalFilterStruct>? caseMaterial,
    List<GlobalFilterStruct>? dialColor,
    List<GlobalFilterStruct>? movement,
    List<GlobalFilterStruct>? braceletMaterial,
    List<GlobalFilterStruct>? claspMaterial,
    List<GlobalFilterStruct>? infoSource,
    List<GlobalFilterStruct>? condition,
    List<GlobalFilterStruct>? country,
  })  : _manufacturer = manufacturer,
        _model = model,
        _referenceNumber = referenceNumber,
        _caseSize = caseSize,
        _caseMaterial = caseMaterial,
        _dialColor = dialColor,
        _movement = movement,
        _braceletMaterial = braceletMaterial,
        _claspMaterial = claspMaterial,
        _infoSource = infoSource,
        _condition = condition,
        _country = country;

  // "manufacturer" field.
  List<GlobalFilterStruct>? _manufacturer;
  List<GlobalFilterStruct> get manufacturer => _manufacturer ?? const [];
  set manufacturer(List<GlobalFilterStruct>? val) => _manufacturer = val;

  void updateManufacturer(Function(List<GlobalFilterStruct>) updateFn) {
    updateFn(_manufacturer ??= []);
  }

  bool hasManufacturer() => _manufacturer != null;

  // Method to find the first non-empty list
  List<GlobalFilterStruct>? firstNonEmptyList() {
    // Check each list and return the first one that's not null and not empty
    if (_manufacturer != null && _manufacturer!.isNotEmpty) {
      return _manufacturer;
    }
    if (_model != null && _model!.isNotEmpty) {
      return _model;
    }
    if (_referenceNumber != null && _referenceNumber!.isNotEmpty) {
      return _referenceNumber;
    }
    if (_caseSize != null && _caseSize!.isNotEmpty) {
      return _caseSize;
    }
    if (_caseMaterial != null && _caseMaterial!.isNotEmpty) {
      return _caseMaterial;
    }
    if (_dialColor != null && _dialColor!.isNotEmpty) {
      return _dialColor;
    }
    if (_movement != null && _movement!.isNotEmpty) {
      return _movement;
    }
    if (_braceletMaterial != null && _braceletMaterial!.isNotEmpty) {
      return _braceletMaterial;
    }
    if (_claspMaterial != null && _claspMaterial!.isNotEmpty) {
      return _claspMaterial;
    }
    if (_infoSource != null && _infoSource!.isNotEmpty) {
      return _infoSource;
    }
    if (_condition != null && _condition!.isNotEmpty) {
      return _condition;
    }
    if (_country != null && _country!.isNotEmpty) {
      return _country;
    }
    // Return null if no non-empty list found
    return null;
  }

  Map<String, List<GlobalFilterStruct>> organizeFirstNonEmptyList() {
    List<GlobalFilterStruct>? dataList =
        firstNonEmptyList(); // This method should be implemented in your struct to find the first non-empty list

    if (dataList == null) {
      return {};
    }

    Map<String, List<GlobalFilterStruct>> organizedData = {};
    for (var item in dataList) {
      if (item.value.isNotEmpty) {
        String firstLetter = item.value[0].toUpperCase();
        organizedData.putIfAbsent(firstLetter, () => []).add(item);
      }
    }

    // Sorting each list alphabetically by the 'value' property
    organizedData.forEach((key, list) {
      list.sort((a, b) => a.value.compareTo(b.value));
    });

    return organizedData;
  }

  // "model" field.
  List<GlobalFilterStruct>? _model;
  List<GlobalFilterStruct> get model => _model ?? const [];
  set model(List<GlobalFilterStruct>? val) => _model = val;

  void updateModel(Function(List<GlobalFilterStruct>) updateFn) {
    updateFn(_model ??= []);
  }

  bool hasModel() => _model != null;

  // "referenceNumber" field.
  List<GlobalFilterStruct>? _referenceNumber;
  List<GlobalFilterStruct> get referenceNumber => _referenceNumber ?? const [];
  set referenceNumber(List<GlobalFilterStruct>? val) => _referenceNumber = val;

  void updateReferenceNumber(Function(List<GlobalFilterStruct>) updateFn) {
    updateFn(_referenceNumber ??= []);
  }

  bool hasReferenceNumber() => _referenceNumber != null;

  // "caseSize" field.
  List<GlobalFilterStruct>? _caseSize;
  List<GlobalFilterStruct> get caseSize => _caseSize ?? const [];
  set caseSize(List<GlobalFilterStruct>? val) => _caseSize = val;

  void updateCaseSize(Function(List<GlobalFilterStruct>) updateFn) {
    updateFn(_caseSize ??= []);
  }

  bool hasCaseSize() => _caseSize != null;

  // "caseMaterial" field.
  List<GlobalFilterStruct>? _caseMaterial;
  List<GlobalFilterStruct> get caseMaterial => _caseMaterial ?? const [];
  set caseMaterial(List<GlobalFilterStruct>? val) => _caseMaterial = val;

  void updateCaseMaterial(Function(List<GlobalFilterStruct>) updateFn) {
    updateFn(_caseMaterial ??= []);
  }

  bool hasCaseMaterial() => _caseMaterial != null;

  // "dialColor" field.
  List<GlobalFilterStruct>? _dialColor;
  List<GlobalFilterStruct> get dialColor => _dialColor ?? const [];
  set dialColor(List<GlobalFilterStruct>? val) => _dialColor = val;

  void updateDialColor(Function(List<GlobalFilterStruct>) updateFn) {
    updateFn(_dialColor ??= []);
  }

  bool hasDialColor() => _dialColor != null;

  // "movement" field.
  List<GlobalFilterStruct>? _movement;
  List<GlobalFilterStruct> get movement => _movement ?? const [];
  set movement(List<GlobalFilterStruct>? val) => _movement = val;

  void updateMovement(Function(List<GlobalFilterStruct>) updateFn) {
    updateFn(_movement ??= []);
  }

  bool hasMovement() => _movement != null;

  // "braceletMaterial" field.
  List<GlobalFilterStruct>? _braceletMaterial;
  List<GlobalFilterStruct> get braceletMaterial =>
      _braceletMaterial ?? const [];
  set braceletMaterial(List<GlobalFilterStruct>? val) =>
      _braceletMaterial = val;

  void updateBraceletMaterial(Function(List<GlobalFilterStruct>) updateFn) {
    updateFn(_braceletMaterial ??= []);
  }

  bool hasBraceletMaterial() => _braceletMaterial != null;

  // "claspMaterial" field.
  List<GlobalFilterStruct>? _claspMaterial;
  List<GlobalFilterStruct> get claspMaterial => _claspMaterial ?? const [];
  set claspMaterial(List<GlobalFilterStruct>? val) => _claspMaterial = val;

  void updateClaspMaterial(Function(List<GlobalFilterStruct>) updateFn) {
    updateFn(_claspMaterial ??= []);
  }

  bool hasClaspMaterial() => _claspMaterial != null;

  // "infoSource" field.
  List<GlobalFilterStruct>? _infoSource;
  List<GlobalFilterStruct> get infoSource => _infoSource ?? const [];
  set infoSource(List<GlobalFilterStruct>? val) => _infoSource = val;

  void updateInfoSource(Function(List<GlobalFilterStruct>) updateFn) {
    updateFn(_infoSource ??= []);
  }

  bool hasInfoSource() => _infoSource != null;

  // "condition" field.
  List<GlobalFilterStruct>? _condition;
  List<GlobalFilterStruct> get condition => _condition ?? const [];
  set condition(List<GlobalFilterStruct>? val) => _condition = val;

  void updateCondition(Function(List<GlobalFilterStruct>) updateFn) {
    updateFn(_condition ??= []);
  }

  bool hasCondition() => _condition != null;

  // "country" field.
  List<GlobalFilterStruct>? _country;
  List<GlobalFilterStruct> get country => _country ?? const [];
  set country(List<GlobalFilterStruct>? val) => _country = val;

  void updateCountry(Function(List<GlobalFilterStruct>) updateFn) {
    updateFn(_country ??= []);
  }

  bool hasCountry() => _country != null;

  static GlobalFilterSubDataStruct fromMap(Map<String, dynamic> data) =>
      GlobalFilterSubDataStruct(
        manufacturer: getStructList(
          data['manufacturer'],
          GlobalFilterStruct.fromMap,
        ),
        model: getStructList(
          data['model'],
          GlobalFilterStruct.fromMap,
        ),
        referenceNumber: getStructList(
          data['referenceNumber'],
          GlobalFilterStruct.fromMap,
        ),
        caseSize: getStructList(
          data['caseSize'],
          GlobalFilterStruct.fromMap,
        ),
        caseMaterial: getStructList(
          data['caseMaterial'],
          GlobalFilterStruct.fromMap,
        ),
        dialColor: getStructList(
          data['dialColor'],
          GlobalFilterStruct.fromMap,
        ),
        movement: getStructList(
          data['movement'],
          GlobalFilterStruct.fromMap,
        ),
        braceletMaterial: getStructList(
          data['braceletMaterial'],
          GlobalFilterStruct.fromMap,
        ),
        claspMaterial: getStructList(
          data['claspMaterial'],
          GlobalFilterStruct.fromMap,
        ),
        infoSource: getStructList(
          data['infoSource'],
          GlobalFilterStruct.fromMap,
        ),
        condition: getStructList(
          data['condition'],
          GlobalFilterStruct.fromMap,
        ),
        country: getStructList(
          data['country'],
          GlobalFilterStruct.fromMap,
        ),
      );

  static GlobalFilterSubDataStruct? maybeFromMap(dynamic data) => data is Map
      ? GlobalFilterSubDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'manufacturer': _manufacturer?.map((e) => e.toMap()).toList(),
        'model': _model?.map((e) => e.toMap()).toList(),
        'referenceNumber': _referenceNumber?.map((e) => e.toMap()).toList(),
        'caseSize': _caseSize?.map((e) => e.toMap()).toList(),
        'caseMaterial': _caseMaterial?.map((e) => e.toMap()).toList(),
        'dialColor': _dialColor?.map((e) => e.toMap()).toList(),
        'movement': _movement?.map((e) => e.toMap()).toList(),
        'braceletMaterial': _braceletMaterial?.map((e) => e.toMap()).toList(),
        'claspMaterial': _claspMaterial?.map((e) => e.toMap()).toList(),
        'infoSource': _infoSource?.map((e) => e.toMap()).toList(),
        'condition': _condition?.map((e) => e.toMap()).toList(),
        'country': _country?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'manufacturer': serializeParam(
          _manufacturer,
          ParamType.DataStruct,
          isList: true,
        ),
        'model': serializeParam(
          _model,
          ParamType.DataStruct,
          isList: true,
        ),
        'referenceNumber': serializeParam(
          _referenceNumber,
          ParamType.DataStruct,
          isList: true,
        ),
        'caseSize': serializeParam(
          _caseSize,
          ParamType.DataStruct,
          isList: true,
        ),
        'caseMaterial': serializeParam(
          _caseMaterial,
          ParamType.DataStruct,
          isList: true,
        ),
        'dialColor': serializeParam(
          _dialColor,
          ParamType.DataStruct,
          isList: true,
        ),
        'movement': serializeParam(
          _movement,
          ParamType.DataStruct,
          isList: true,
        ),
        'braceletMaterial': serializeParam(
          _braceletMaterial,
          ParamType.DataStruct,
          isList: true,
        ),
        'claspMaterial': serializeParam(
          _claspMaterial,
          ParamType.DataStruct,
          isList: true,
        ),
        'infoSource': serializeParam(
          _infoSource,
          ParamType.DataStruct,
          isList: true,
        ),
        'condition': serializeParam(
          _condition,
          ParamType.DataStruct,
          isList: true,
        ),
        'country': serializeParam(
          _country,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static GlobalFilterSubDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GlobalFilterSubDataStruct(
        manufacturer: deserializeStructParam<GlobalFilterStruct>(
          data['manufacturer'],
          ParamType.DataStruct,
          true,
          structBuilder: GlobalFilterStruct.fromSerializableMap,
        ),
        model: deserializeStructParam<GlobalFilterStruct>(
          data['model'],
          ParamType.DataStruct,
          true,
          structBuilder: GlobalFilterStruct.fromSerializableMap,
        ),
        referenceNumber: deserializeStructParam<GlobalFilterStruct>(
          data['referenceNumber'],
          ParamType.DataStruct,
          true,
          structBuilder: GlobalFilterStruct.fromSerializableMap,
        ),
        caseSize: deserializeStructParam<GlobalFilterStruct>(
          data['caseSize'],
          ParamType.DataStruct,
          true,
          structBuilder: GlobalFilterStruct.fromSerializableMap,
        ),
        caseMaterial: deserializeStructParam<GlobalFilterStruct>(
          data['caseMaterial'],
          ParamType.DataStruct,
          true,
          structBuilder: GlobalFilterStruct.fromSerializableMap,
        ),
        dialColor: deserializeStructParam<GlobalFilterStruct>(
          data['dialColor'],
          ParamType.DataStruct,
          true,
          structBuilder: GlobalFilterStruct.fromSerializableMap,
        ),
        movement: deserializeStructParam<GlobalFilterStruct>(
          data['movement'],
          ParamType.DataStruct,
          true,
          structBuilder: GlobalFilterStruct.fromSerializableMap,
        ),
        braceletMaterial: deserializeStructParam<GlobalFilterStruct>(
          data['braceletMaterial'],
          ParamType.DataStruct,
          true,
          structBuilder: GlobalFilterStruct.fromSerializableMap,
        ),
        claspMaterial: deserializeStructParam<GlobalFilterStruct>(
          data['claspMaterial'],
          ParamType.DataStruct,
          true,
          structBuilder: GlobalFilterStruct.fromSerializableMap,
        ),
        infoSource: deserializeStructParam<GlobalFilterStruct>(
          data['infoSource'],
          ParamType.DataStruct,
          true,
          structBuilder: GlobalFilterStruct.fromSerializableMap,
        ),
        condition: deserializeStructParam<GlobalFilterStruct>(
          data['condition'],
          ParamType.DataStruct,
          true,
          structBuilder: GlobalFilterStruct.fromSerializableMap,
        ),
        country: deserializeStructParam<GlobalFilterStruct>(
          data['country'],
          ParamType.DataStruct,
          true,
          structBuilder: GlobalFilterStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GlobalFilterSubDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GlobalFilterSubDataStruct &&
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
        listEquality.equals(condition, other.condition) &&
        listEquality.equals(country, other.country);
  }

  @override
  int get hashCode => const ListEquality().hash([
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
        condition,
        country
      ]);
}

GlobalFilterSubDataStruct createGlobalFilterSubDataStruct() =>
    GlobalFilterSubDataStruct();
