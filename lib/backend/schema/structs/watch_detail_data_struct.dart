// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchDetailDataStruct extends BaseStruct {
  WatchDetailDataStruct({
    WatchDetailSubDataStruct? data,
    List<dynamic>? excludedFields,
  })  : _data = data,
        _excludedFields = excludedFields;

  // "data" field.
  WatchDetailSubDataStruct? _data;
  WatchDetailSubDataStruct get data => _data ?? WatchDetailSubDataStruct();
  set data(WatchDetailSubDataStruct? val) => _data = val;

  void updateData(Function(WatchDetailSubDataStruct) updateFn) {
    updateFn(_data ??= WatchDetailSubDataStruct());
  }

  bool hasData() => _data != null;

  // "excludedFields" field.
  List<dynamic>? _excludedFields;
  List<dynamic> get excludedFields => _excludedFields ?? [];
  set excludedFields(List<dynamic>? val) => _excludedFields = val;

  void updateExcludedFields(Function(List<dynamic>) updateFn) {
    updateFn(_excludedFields ??= []);
  }

  bool hasExcludedFields() => _excludedFields != null;

  List<String> extractWatchDetail() {
    List<String> watchDetails = [];

    for (var item in excludedFields) {
      if (item is Map<String, dynamic> && item.containsKey('watchDetail')) {
        var possibleList = item['watchDetail'];
        if (possibleList is List) {
          // Attempt to cast each element to String and add to the list
          watchDetails.addAll(possibleList.map((e) => e.toString()).toList());
        }
      }
    }

    return watchDetails;
  }

  static WatchDetailDataStruct fromMap(Map<String, dynamic> data) =>
      WatchDetailDataStruct(
          data: WatchDetailSubDataStruct.maybeFromMap(data['data']),
          excludedFields: data['excludedFields'] as List<dynamic>?);

  static WatchDetailDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WatchDetailDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
        'excludedFields':
            serializeParam(_excludedFields, ParamType.DataStruct, isList: true)
      }.withoutNulls;

  static WatchDetailDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      WatchDetailDataStruct(
          data: deserializeStructParam(
            data['data'],
            ParamType.DataStruct,
            false,
            structBuilder: WatchDetailSubDataStruct.fromSerializableMap,
          ),
          excludedFields: deserializeParam(
            data['excludedFields'],
            ParamType.DataStruct,
            true,
          ));

  @override
  String toString() => 'WatchDetailDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchDetailDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

WatchDetailDataStruct createWatchDetailDataStruct(
        {WatchDetailSubDataStruct? data, List<dynamic>? excludedFields}) =>
    WatchDetailDataStruct(
        data: data ?? WatchDetailSubDataStruct(),
        excludedFields: excludedFields ?? []);
