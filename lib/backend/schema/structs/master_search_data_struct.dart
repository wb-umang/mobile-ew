// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MasterSearchDataStruct extends BaseStruct {
  MasterSearchDataStruct({
    List<MasterSearchStruct>? masterSearchs,
  }) : _masterSearchs = masterSearchs;

  // "masterSearchs" field.
  List<MasterSearchStruct>? _masterSearchs;
  List<MasterSearchStruct> get masterSearchs => _masterSearchs ?? const [];
  set masterSearchs(List<MasterSearchStruct>? val) => _masterSearchs = val;

  void updateAllWatchListings(Function(List<MasterSearchStruct>) updateFn) {
    updateFn(_masterSearchs ??= []);
  }

  bool hasAllWatchListings() => _masterSearchs != null;

  static MasterSearchDataStruct fromMap(Map<String, dynamic> data) =>
      MasterSearchDataStruct(
          masterSearchs: getStructList(
        data['masterSearch'],
        MasterSearchStruct.fromMap,
      ));

  static MasterSearchDataStruct? maybeFromMap(dynamic data) => data is Map
      ? MasterSearchDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'masterSearch': _masterSearchs?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'masterSearch': serializeParam(
          _masterSearchs,
          ParamType.DataStruct,
          isList: true,
        )
      }.withoutNulls;

  static MasterSearchDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MasterSearchDataStruct(
        masterSearchs: deserializeStructParam<MasterSearchStruct>(
          data['masterSearch'],
          ParamType.DataStruct,
          true,
          structBuilder: MasterSearchStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MasterSearchDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MasterSearchDataStruct &&
        listEquality.equals(masterSearchs, other.masterSearchs);
  }

  @override
  int get hashCode => const ListEquality().hash([masterSearchs]);
}

MasterSearchDataStruct createMasterSearchDataStruct() =>
    MasterSearchDataStruct();
