// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterOptionStruct extends BaseStruct {
  FilterOptionStruct({
    String? key,
    FilterValueStruct? value,
  })  : _key = key,
        _value = value;

  // "key" field.
  String? _key;
  String get key => _key ?? '';
  set key(String? val) => _key = val;

  bool hasKey() => _key != null;

  // "value" field.
  FilterValueStruct? _value;
  FilterValueStruct get value => _value ?? FilterValueStruct();
  set value(FilterValueStruct? val) => _value = val;

  void updateValue(Function(FilterValueStruct) updateFn) {
    updateFn(_value ??= FilterValueStruct());
  }

  bool hasValue() => _value != null;

  static FilterOptionStruct fromMap(Map<String, dynamic> data) =>
      FilterOptionStruct(
        key: data['key'] as String?,
        value: FilterValueStruct.maybeFromMap(data['value']),
      );

  static FilterOptionStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterOptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'key': _key,
        'value': _value?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'key': serializeParam(
          _key,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static FilterOptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilterOptionStruct(
        key: deserializeParam(
          data['key'],
          ParamType.String,
          false,
        ),
        value: deserializeStructParam(
          data['value'],
          ParamType.DataStruct,
          false,
          structBuilder: FilterValueStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FilterOptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilterOptionStruct &&
        key == other.key &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([key, value]);
}

FilterOptionStruct createFilterOptionStruct({
  String? key,
  FilterValueStruct? value,
}) =>
    FilterOptionStruct(
      key: key,
      value: value ?? FilterValueStruct(),
    );
