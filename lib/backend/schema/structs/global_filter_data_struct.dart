// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlobalFilterDataStruct extends BaseStruct {
  GlobalFilterDataStruct({
    GlobalFilterSubDataStruct? globalFilter,
  }) : _globalFilter = globalFilter;

  // "globalFilter" field.
  GlobalFilterSubDataStruct? _globalFilter;
  GlobalFilterSubDataStruct get globalFilter =>
      _globalFilter ?? GlobalFilterSubDataStruct();
  set globalFilter(GlobalFilterSubDataStruct? val) => _globalFilter = val;

  void updateGlobalFilter(Function(GlobalFilterSubDataStruct) updateFn) {
    updateFn(_globalFilter ??= GlobalFilterSubDataStruct());
  }

  bool hasGlobalFilter() => _globalFilter != null;

  static GlobalFilterDataStruct fromMap(Map<String, dynamic> data) =>
      GlobalFilterDataStruct(
        globalFilter:
            GlobalFilterSubDataStruct.maybeFromMap(data['globalFilter']),
      );

  static GlobalFilterDataStruct? maybeFromMap(dynamic data) => data is Map
      ? GlobalFilterDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'globalFilter': _globalFilter?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'globalFilter': serializeParam(
          _globalFilter,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static GlobalFilterDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GlobalFilterDataStruct(
        globalFilter: deserializeStructParam(
          data['globalFilter'],
          ParamType.DataStruct,
          false,
          structBuilder: GlobalFilterSubDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GlobalFilterDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GlobalFilterDataStruct &&
        globalFilter == other.globalFilter;
  }

  @override
  int get hashCode => const ListEquality().hash([globalFilter]);
}

GlobalFilterDataStruct createGlobalFilterDataStruct({
  GlobalFilterSubDataStruct? globalFilter,
}) =>
    GlobalFilterDataStruct(
      globalFilter: globalFilter ?? GlobalFilterSubDataStruct(),
    );
